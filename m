Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A6A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3epGEzvY;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DQfwROO0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yeHQQxEc7Gou5vCe9VVvBgjTfw4hsENbh9TrVOeRMog=; b=3epGEzvYtT3Bhh7xh/YgG2aBxP
	V//+MOo/Nay03zqdI5Xn11v/jbS463SCM0ptSBHCYAVZOlJUlPBLrgl14HDyuPj+nA+IApK5OOtUu
	I4IwcI8O51j6hOlVxREqI9nbR1Jp1Dc05Ze3oCWVjm9Bv5JxfU4DsEhgzDK7b1YxjRIdcN9h7VYQb
	aGJAjHJrm1dhcxGAUnaA4NczCysSvg1zzSAqHZHOO7m9Rss7flfae84uJXCGGw1FI2ivI8u2BzBxk
	ZnqnRXh7Vr/87sIwkVjfD1NZ87XZAd/f4/uSeBqpEQJVEVAMStY+glt82JJxS8zuR/lNxdMeF2I7q
	3UH8e6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyCi-0000000Guj6-1J82;
	Fri, 27 Nov 2026 15:49:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyCg-0000000GuiR-0TQG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:49:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CB832F;
	Fri, 27 Nov 2026 07:49:34 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D37253F632;
	Fri, 27 Nov 2026 07:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795794577; bh=yeHQQxEc7Gou5vCe9VVvBgjTfw4hsENbh9TrVOeRMog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQfwROO0omm1UYPhtG5c4yjZkdDi+/kBc+g37J6HAPe5FOXS/v0t7sbwvDnKpcVOC
	 kM1MVV5qbqdxFbx4S73wNJp3AJ1e7fIJPc2SoSnU30R4xQ1mYqDQius1EY/1oFw4O2
	 S2rJ+WO1Sqe4D+fju3x01cHiLI22oK96kYihZdbc=
Date: Fri, 27 Nov 2026 15:49:34 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 08/23] coresight: trbe: Clear stale external abort
 status
Message-ID: <20261127154934.GG861809@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-8-3f57cf3199b1@arm.com>
 <718f6c8c-71cd-414b-9ac1-11528dc35f24@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <718f6c8c-71cd-414b-9ac1-11528dc35f24@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_074938_193966_D4CCBDCB 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 11:19:17AM +0000, Suzuki K Poulose wrote:

> minor nit: In the future, please keep all the "stable" fixes at the
> beginning of a series. That allows people to apply them without the
> other dependencies (even though this one doesn't) and allows maintainers
> to pick up the patches from a series (without applying the entire
> series).

Sure, I'll move the fix patches to the front of the series.

Thanks,
Leo

