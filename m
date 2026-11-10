Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698EE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0XNs4fTa;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uy/4Vzm5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RyGS5BYQsgIK0f3SZKWntgu4dy9J/rSB7/HXNadBGz8=; b=0XNs4fTaqAO+ITTsbcM5nLtwcY
	XuEHHej26xZPavvgDf4jwh2YiTKpB5FpZICH8q2l+vBmUCcSncwvvnQGQHo9h6i348/rIfCn8TtjH
	+Rnp334dOiiQcC9taAg192bFAf+WIvqWQKKyQbdp5EzuswPUD3ATTlXNyGR8YVyK/6TDVroLlIIOL
	LoZfLkZnKSxkX49iq3mE7+idGbAGNzKnA1nLaJz3eEMcWCOJ1TU8hBDP5WlyqSEfrLD9+gdy3K39A
	ok93Qdf22mXMWO3w4c+dj81Pdo5B2MS4jFqTPjQ0A+5pCHV1hniJf+D5zhvE9EraNVYohWtmMip58
	0bBKIKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh4y-000000035w1-1I2f;
	Tue, 10 Nov 2026 08:19:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQh4t-000000035sM-3YkS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:19:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35E851516;
	Tue, 10 Nov 2026 00:19:35 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13B6F3F85F;
	Tue, 10 Nov 2026 00:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794298778; bh=ylG4St2aJ0VmW2ktR8NjqrmUljZZyPC2qz7U+ukHujw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uy/4Vzm5LDCZlKDKG5l1x/8xmaojsxT1a3TtNv2PeVPUz1aDBNZmmO4CPoT2426OG
	 bVhM1ePo8CDGr+jaVsc26knbdY86TVpU9bwEmgHiczkZwj8OBUH1i8IjZfhMtNWTtx
	 fyFOGnXcW+l903eZ3/xC5t8UL3JnPQNJ9gZqBDZw=
Date: Tue, 10 Nov 2026 08:19:28 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 01/35] firmware: arm_scmi: Harden iterators state
 parsing
Message-ID: <avLTkAtQQSzpgu2A@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-2-cristian.marussi@arm.com>
 <20261109135713.000049d6@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109135713.000049d6@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_001940_021576_3B3AC6E5 
X-CRM114-Status: UNSURE (   9.86  )
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

On Mon, Nov 09, 2026 at 01:57:13PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:47 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add checks in the core multi-part iterators support to detect generally
> > malformed and incosistent multi-part replies.
> 
> Spell check patch descriptions.  inconsistent.

Ah...checkpatch let me down another time

> 
> Otherwise seems fine but I'm too lazy to check all existing protocols for
> that minimum size!
>

Indeed I was too lazy to add a dedicated parameter to all the call-sites
so I verified that any possible standard/vendor protocol has that
minimum size as of now, since in fcat it is the minimum viable payload
needed to hold num_returned/num_remanining...if any future spec will
change this we'll evolve accordingly/...for now it is the simplest
approach (and kills a lot of Sashiko complaints scattered all over :P)
 
Thanks,
Cristian

