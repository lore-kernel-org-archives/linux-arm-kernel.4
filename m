Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8086D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gOKHV7AT;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eBvNZkSo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D4tW1TAfFvOxEpv444o0Uj+/5uyvixONHdxp9CLi34M=; b=gOKHV7ATp+p5OLdFHARIvjjg/V
	aMJUT3DAtwVFR+WMeKJ9ddptroi1nazlAk52Fjos+IHQYKHgqJp7nDYxYmQ/+ay+yi/++2QR3KKZm
	IXikNW1axLPfb73hfcYGCAr0CKju3aFZqrOK2L867Mr1x9LIw7wIn8kw3iRx1Eo9sWomuG9cltyjo
	EeCEUB5uiqiLupztZlzFXq/+fB76PGHK2n+mFzsoMokmzaR8IfbM627ZPkglWJ4sDe7qtfwxD/AU0
	tMYD7LMvLjeioZ7LPKJtChch2lGlCNW0szH5t6//IBivUCG5qJwjS9SBiHp2qeAv73E8GyHpSqZxC
	Xon9HZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIxK-00000005rSR-1KCU;
	Tue, 17 Nov 2026 13:10:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIxE-00000005rQh-1Li8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:10:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2631A1476;
	Tue, 17 Nov 2026 05:10:28 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A67823F632;
	Tue, 17 Nov 2026 05:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794921031; bh=3rwAxBhio7Lo7SXHtTbUlWdUnStP/TP/HJl8yyAZ1Ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBvNZkSoC+giD1oPcrvkal1qQXxhc3EDROAUYlay2fNQ588mgreUOmmYlC/SRUE6y
	 iX95SjBgz57o8Q7TAQVp0RGcVWNMaTbsaOMC1bgvnFXEtaax8RDiMCraXoOr+X287g
	 SlBegSaBetAKuZjoTVrtEmVczfzjjcTvbjPTibCo=
Date: Tue, 17 Nov 2026 13:10:20 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <avxSPGYrREHtzjXi@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261117-enchanted-neat-donkey-8393a9@sudeepholla>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-enchanted-neat-donkey-8393a9@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_051032_870722_C58756C1 
X-CRM114-Status: GOOD (  26.42  )
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

On Tue, Nov 17, 2026 at 12:43:15PM +0000, Sudeep Holla wrote:
> On Mon, Nov 09, 2026 at 09:11:46AM +0000, Cristian Marussi wrote:
> > Hi all,
> > 

Hi,

> -- 

[snip]

>    + hardened core iterator parsing of multi-part reply
> > 
> 
> You can drop the change log for earlier versions(just last 3 should suffice)
> in the future postings and add links to them instead if anyone is really
> interested to go back. Don't worry about older links now, just do that
> in the future.
> 

Ok.

> [...]
> 
> As mentioned in one of the thread, this is quite big series with not
> much feedback on the UABI part apart for Jonathan. So we need to take
> an approach of merging this in smaller parts initially.
>

Yes I have already split put unused features from V16 both from the
protocol layer and from the driver.

 - no GROUPS
 - no NOTIFICATION
 - no SAMPLE READ (async delayed response)

This way the series is roughly 6500 lines (without docs/ksft/test tool)

...now I was starting going through residual Sashiko bugs of the initial
part of the series (at least), assuming more discussion are needed around
the ABI anyway (still to reply to latest Jonathan mail)


> > Cristian Marussi (34):
> >   firmware: arm_scmi: Harden iterators state parsing
> 
> The above looks good.
> 
> >   firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
> >   firmware: arm_scmi: Introduce a dedicated SCMI Errors header
> 
> As pointed out, better to swap the order of above 2.
>

Ok.
 
> >   firmware: arm_scmi: Allow registration of unknown-size events/reports
> >   firmware: arm_scmi: Refactor __scmi_event_handler_get_ops helper
> >   firmware: arm_scmi: Introduce protocol instance notifiers
> 
> All the above 3 refactor the code, so better to fix the Sashiko reported
> bugs around them before go for such additions/refactoring IMO.
>

I dropeed protocol protocol instance support and notification as
discussed, the new series layout is roughly (with docs/ksft/tool still
to apply split):

c1266f348da4 firmware: arm_scmi: Enable autoloading for System Telemetry driver
8ff6d68673ff firmware: arm_scmi: Add System Telemetry driver
2ab95adf4c0d uapi: Add ARM SCMI Telemetry definitions
8a79c0ca1d11 firmware: arm_scmi: Expose per-instance identifier
ec676846f78c firmware: arm_scmi: Add Telemetry debugfs ABI documentation
6798c6701682 firmware: arm_scmi: Add Telemetry debugfs SHMTI dump support
58cba74addfd firmware: arm_scmi: Add common per-protocol debugfs support
fdfd27649a6e firmware: arm_scmi: Add Telemetry boot-on support
6737d7a797c0 firmware: arm_scmi: Add Telemetry Single/Bulk DEs reads
5507b8b44d15 firmware: arm_scmi: Add Telemetry global configuration support
7aa4c04a61a8 firmware: arm_scmi: Add Telemetry DEs configuration support
e2eec907cddc firmware: arm_scmi: Add Telemetry TDCF parsing for UUID lines
d3c453be30c6 firmware: arm_scmi: Add Telemetry TDCF parsing for BLK_TS lines
328be9a8b32b firmware: arm_scmi: Add Telemetry TDCF areas parsing support
e5d64de593ee firmware: arm_scmi: Add Telemetry SHMTI areas enumeration
d5f25597262d firmware: arm_scmi: Add Telemetry global update intervals enumeration
e23dffd6a103 firmware: arm_scmi: Add Telemetry resources enumeration
dac0f7d33c76 firmware: arm_scmi: Add Telemetry basic attributes enumeration
fa02803cbb1a include: trace: Add Telemetry trace events
4b510f42e44d dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
11f799fe30a4 firmware: arm_scmi: Refactor __scmi_event_handler_get_ops helper
3a2706fedd66 firmware: arm_scmi: Allow registration of unknown-size events/reports
5d196fe1290e firmware: arm_scmi: Introduce a dedicated SCMI Errors header
1877db16c4f5 firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
38e65d778a52 firmware: arm_scmi: Harden iterators state parsing

...BUT especially the removal of GROUPS led to considerable rework so
the above commits does NOT really match the same commit in V15

> >   dt-bindings: firmware: arm,scmi: Add support for telemetry protocol
> >   include: trace: Add Telemetry trace events
> >   firmware: arm_scmi: Add Telemetry basic attributes enumeration
> >   firmware: arm_scmi: Add Telemetry resources enumeration
> >   firmware: arm_scmi: Add Telemetry groups initialization
> >   firmware: arm_scmi: Add Telemetry update intervals enumeration
> >   firmware: arm_scmi: Add Telemetry SHMTI areas enumeration
> >   firmware: arm_scmi: Add Telemetry TDCF areas parsing support
> >   firmware: arm_scmi: Add Telemetry TDCF parsing for BLK_TS lines
> >   firmware: arm_scmi: Add Telemetry TDCF parsing for UUID lines
> >   firmware: arm_scmi: Add Telemetry configuration operations
> >   firmware: arm_scmi: Add Telemetry DataEvent read capabilities
> >   firmware: arm_scmi: Add Telemetry reset logic
> >   firmware: arm_scmi: Add Telemetry notification support
> >   firmware: arm_scmi: Add Telemetry boot-on support
> >   firmware: arm-scmi: Add Telemetry generic event support
> >   firmware: arm_scmi: Add Telemetry generation counter event
> 
> I am thinking of initially merging upto the above commit initially so that
> no user ABI is established. I haven't done the thorough review yet.

Beside a lot of stuff that I removed (like groups all over) there are
outstanding Sashiko issue in the V15/V16 code that I was going to
address now.

Given that, as I understood the agreement was to shed a lot of still
unused features the current V15 and next V16 will be sensibly different.

Thanks,
Cristian

