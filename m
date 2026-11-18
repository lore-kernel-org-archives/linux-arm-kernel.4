Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OUpfj5U+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=id5o74cC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g/9ZH6DNMENaUgvjOSvQCfo6co4d5atT2nU3ht73jxo=; b=OUpfj5U+n7mve1YP2z6DQ32oBG
	szlYLRqPRqp6MX3eotTJ878sOAPVlQviF+2WZCdaP5ADtPXJ/xVs8whMOfuHsJJSTTW9GPYjMaULL
	dN8miZNsmUR42BL/swsoiRQUPZDM7R00kR/aaRKJ6o63E5l+y0/Z/wSxIYy5cbBGfKtFujSM/dEI4
	7/2KjYrVYY1g34BNqeHHBCAHoBRljaOtPZqbw5R5/na8o+BGGb4g779jd0B4vQ/hIS9+vAmmNXvvF
	6Hr5s7GymQNwAq7CKcxm4YH+u/38W7Wb1RMpQXbmARmGDyMiYcz859O/j/ztBj8/U3n4UxcksFXsc
	/IxnIQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbkw-00000008JRH-1WNX;
	Wed, 18 Nov 2026 09:15:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbks-00000008JQ8-15rn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:15:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 300BC1596;
	Wed, 18 Nov 2026 01:14:58 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 977943F673;
	Wed, 18 Nov 2026 01:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794993301; bh=hXuGwUcvD/JxHCPow69F+CSxS8aDisV0O4ydUJG851A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=id5o74cClBTwYA2qK9D22IG2CfqVOTH+tVR0uCcoXDwqhljGpYqufMaxuFWvI/Jc8
	 uHq/NEp8JLsQM5PEOXTAIYZxhqiQs6g4fV6iXt2pXLq90vmDCWv49R0ziKh/zIUaJb
	 q7vwdiFckE/oyB07oCYPbHuBDUSN2w7VAuh3ESK0=
Date: Wed, 18 Nov 2026 09:14:55 +0000
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
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <av1sj-UEhz_F7R44@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261117170709.00002088@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117170709.00002088@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_011502_421598_78C30180 
X-CRM114-Status: GOOD (  22.63  )
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

On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote:
> On Mon,  9 Nov 2026 09:11:46 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Hi all,

Hi,

> > 
> > [TLDR Summary]
> >  [V15 highlights]
> >  - general cleanup and hardening driven by reviews
> >  - improved TDCF access routines to minimize lost samples under load
> >  - completed ABI docs
> > 
> >  [V16 TODO]
> >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > 
> > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > dedicated to System Telemetry.
> 
> This is one from the family of issues you find when reviewing ones own
> (well LLM generated) emulation, realizing it doesn't match the spec,
> and yet works.
> 
> This works fine without the required SCMI protocol property in ACPI.
> 2.2.2 of ACPI for System Control and Management Interface 1.0
> Platform Design Document. 111115A 1.0
> 
> Now, in here is an informative statement...
> 
> Protocols not listed using a property may not be enumerate by the operating system.
> 
> But they are... 
> 
> So, obviously we can ignore informative spec lines but that is a pretty strong
> sentence. I can't immediately think of what would go wrong if we ignored it
> - maybe we'd not pick an exclusive PCC and fallback to a common one the firmware
> doesn't want us to use?  But if it doesn't want us to use it why make Telemetry
> discoverable on it.
> 
> Should that be wired through from the ACPI parsing code?
> 
> Anyhow, not something I care that much about but thought I'd call it out
> as an oddity.
> 

AFAICR, I think this is really down to some ambiguity elsewhere in the
ACPI/PCC spec for SCMI, so the implementation deviates a bit from the
behaviour we have on devicetree based SCMI systems where instead a non
DT listed protocol is NOT activated even if provided by FW.

Sudeep has more details on this.

Thanks,
Cristian

