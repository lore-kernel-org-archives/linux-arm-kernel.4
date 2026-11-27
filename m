Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yf1Fq/U2;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NrruEC5+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/vBHlhJ/W1xZToIFFx1FnlTJw/r0UAj/MYnI+1u/MyU=; b=Yf1Fq/U22OOlvCz+XCr/DG1n/a
	KkhgmsAMXgX/y5C31Ja4jzW+QeCFTNby9+kAlvpZQ+wBYQMY/nSFO0tETyxNqIXczt05x5rEXxp63
	oPyd/ynF4BLWl8VEnaY+ZgYJKKU2TwaKBmt0yOIxloCag2XojjrB1NdQiMTQDPK0qdR4fmWPGBvgu
	/yrXRHXsr+0ktOMxFU9Iri7XYnKrHSh3HAvQFBmBr/t7rltHfA2jGeb4dLihn2G+LtZd7Vp7WHfVf
	jpHhoRN4LnXU956g9bXv8NvCaIkL0JkvwZN1HhjdWYitD0zK5nokS6wpiJvq5J/r4maJ49ZT48cGy
	/OQGlphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyDK-0000000GuuQ-1v2b;
	Fri, 27 Nov 2026 15:50:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyDH-0000000GutU-0r2C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:50:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 360DF2F;
	Fri, 27 Nov 2026 07:50:11 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 891343F632;
	Fri, 27 Nov 2026 07:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795794614; bh=WfYS7XzkCTsLbNBcdEp/guv89SRLO1zfUYEw+X3yVdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrruEC5+ls++tnQfEGCdiET9qhxdHv9si6NUzzdUItiMF6244K9aNnhsOs57biYAe
	 ctoc4C8jR2F3U2E1NjpJ2fdu99OvpUU1TFTb+R3JEFFeLuTKTZ26VqQKJe7F0j/lx4
	 b0JDsNqOQdIoRqUvKOS3E5D4YUzpRlUOg8zo3VAQ=
Date: Fri, 27 Nov 2026 15:50:02 +0000
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
Subject: Re: [PATCH v17 11/34] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <awmmqnzicQgmW_KE@pluto>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
 <20261124194841.1147072-12-cristian.marussi@arm.com>
 <20261124155940.0000336d@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124155940.0000336d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_075015_542892_BFAAC923 
X-CRM114-Status: GOOD (  13.46  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 03:59:40PM -0800, Jonathan Cameron wrote:
> On Tue, 24 Nov 2026 19:48:17 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add SCMIv4.0 Telemetry basic support for minimal initialization and
> > protocol attributes enumeration: expose telemetry instance descriptor
> > via a simple information retrieval protocol operation.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > v15 --> v16
> >  - ignore groups
> 
> Partly... Need to do a lot more ignoring to make this true and consistent.
> There are a few things in here, but key is we need the whole framework
> to be as unaware of groups as possible. At least up to the userspace interface
> layer where we may need to ensure extensibility.

As of now I removed the logic, but kept the existing data structure and interfaces
(like grps params in ops) and inhibited where needed any remaining code
path pertaining to groups.

I agree that a more clean but pervasive approach would be to fully obliterate
any group reference and then just re-introduce all of this later when the
extended series will be re-posted...it would be a lot of churn to remove/refactor
and test to just then re-add later all of this support...but yes why not
I can do that.

Thanks,
Cristian

