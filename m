Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640C8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nauD3jTO;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jDHxUj55
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yV5ZF4ovd04Yk8LO1jsbdhbZodkcuM8PKaJ/YNDNZQg=; b=nauD3jTO28BOy1
	eD7Ad0DTry6nasJqKeQKbl2Zu+E88yRst36s1eSki5DEt/QMFuNPU+0yxI3mTDv19srM0+P2vWumT
	CN7vGL3gFt7yROHwxwpyoxX7Ta0iPTrnyRSoeMhSSlrdf90qzAa65X1WVkW9oBCK3AUdmz2KnZcQf
	yOe9SbbHwfIp7kUhEUtyvNze3zKQl1dAP0gAKuDKMmtSXoxR9Gl4qJjHLInTuw1+GV8ENmji1gkRU
	Cbw2RJFsrq6BzS4YVj8cfuuwwUtuPbC3ehoDnvh4RLT+jjb1QgEGroS+sfCH2tzdZnqBQ+n9lIiyS
	lDWCxragASdj2RYYMwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdfs-00000008hEc-1B7s;
	Wed, 18 Nov 2026 11:18:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdfp-00000008hEE-46Gl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:17:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF7061596;
	Wed, 18 Nov 2026 03:17:53 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDB3B3F673;
	Wed, 18 Nov 2026 03:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795000676; bh=cA7Cw/mcdSfEIqCAekaqUsnbbh0sl7jqa85TKPMypr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jDHxUj551E/KPCST/go5rVjQPgWgAkUHRoGAvKwdoMYjgqDZPprH6PrdXL02Nnxak
	 H2iaMuUmpU3dwgn3hQOrhvtRfhuAupbSI+Bl0YL9Q0GzqAmwlANoAxR6Baa9Sdccc4
	 I6ExOfuMwwovYmqX7gLYlc5424IU6sfuiImDo73A=
From: Leonardo Bras <leo.bras@arm.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
Date: Wed, 18 Nov 2026 11:17:49 +0000
Message-ID: <av2JXKl7tBFPd_gD@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117204343.4017815-1-coltonlewis@google.com>
References: <20261116200418.3535619-1-coltonlewis@google.com> <20261116200418.3535619-2-coltonlewis@google.com> <avyNBn24sLjxrfgR@LeoBrasDK> <20261117204343.4017815-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_031758_057532_165F575F 
X-CRM114-Status: UNSURE (   8.72  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 08:42:19PM +0000, Colton Lewis wrote:
> Leonardo Bras <leo.bras@arm.com> writes:
> 
> > Maybe feat_nv2_e2h0_not_res0(). What do you think?
> 
> Agreed on renaming it. Since HCR_EL2.NV1 is the bit marked RES0 (while
> ID_AA64MMFR4_EL1.E2H0 is the signed ID field controlling it), I renamed
> the helper to feat_nv2_nv1_not_res0() in v2.
> 
> -- Colton

Awesome! Thanks!
Leo

