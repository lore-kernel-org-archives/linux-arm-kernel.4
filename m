Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFA9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fLVicspo;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=YOpMKtm7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P6SoTY/qPxSRsFVfVmHV701Duq3Pn8mi7sps2ssRpo0=; b=fLVicspo/lawNn
	yT8N78JoP8+ty5bgrrPgRo1JFmpnLDUNrZL3vG1v07j6SQJOqXT5HgtpENrfEYtx/iekcfxuPoPvT
	He7JCTtOOkmKTgFgmfEHlHhSMzhe9ut9IrtJiJWQq9kSFCJGAbkzJM7Nl56CA8rKzrEUU0uiJ/NcZ
	A9qrWfjLQLDAuDgVkwB5u288atBnr6bRG76PQOWMxPhT4yoL2A8CvQsLurJmYPxslny8zT8jFndDN
	+rdGV4xjd9lWE4a4NSkWC/jZNJjv7M3G7w9y6Rg/LWNBToRz3SjuXSmnq8VtRauKjNwCyxc6fEJpV
	zbB4p0dDzoHpde8kq3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhuS-00000003DTt-1D7i;
	Tue, 10 Nov 2026 09:12:56 +0000
Received: from relay.yourmailgateway.de ([185.244.194.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhuO-00000003DRi-2kgP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:12:54 +0000
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jP1B65cV4z9VR8;
	Tue, 10 Nov 2026 10:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794301918;
	bh=Uxfq+9SLLu4IfxwcONSpQNLgnskcylSEYAOSXGskFCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YOpMKtm7JwzGGfCu+MECFEV5sDtNm1BEiN+bHejH1gjrgt3h9oH5ZSmFAILGWzzJ9
	 gvPRfPduHW6So2e0/PFgsZpunVb0DOB6Nxp7+bmJpOnoVIlBH2szvnEXV2olYK7iDU
	 nfde6UVbD/PRqh+BD66cQ3Tar2rjvMXpBcB/dI3JnsNKky1sdLTxr2FI7vYCwCP1I/
	 xb224RNw4kAXhSd7rPIBA83vLAtHpaagfisnl9hKwTB94f0i1hyEhDCWQ5DLXYA8z/
	 BcovTzac3iLgylZazUzngZtDl/J1Xk6z1+BZN962esa16W5Iiu6XYu59rhnKOc190r
	 m5A+ylD9rSs/A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jP1B64vK8z8129;
	Tue, 10 Nov 2026 10:11:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Score: -2.901
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jP1B35ZP6z8tgk;
	Tue, 10 Nov 2026 10:11:55 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 3321B5FA5B;
	Tue, 10 Nov 2026 10:11:34 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f5ddf27a-9771-4967-a9d0-13c09f588402@leemhuis.info>
Date: Tue, 10 Nov 2026 10:11:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] cpuidle: psci: boot stall/hang on i.MX8MP
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ulf Hansson <ulfh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <20261030171910.2822677-1-dario.binacchi@amarulasolutions.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261030171910.2822677-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179430189496.738146.16548204213021020966@mxe9fb.netcup.net>
X-NC-CID: nXaVOhT/l03j0ELJaOTQF9RW2is43Eqb5I+9yhoMdtaYrpVBfhs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_011253_307149_2236A5C9 
X-CRM114-Status: GOOD (  16.64  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 18:19, Dario Binacchi wrote:
> Hi Ulf,
> 
> on an i.MX8M Plus Dual board (Engicam i.Core MX8M Plus), mainline
> c339f4010dea sometimes stalls for ~0.9 s at boot, or hangs until the
> watchdog resets the board, right after:
> 
>   [    0.806123] ledtrig-cpu: registered to indicate activity on CPUs
> 
> On a good boot the next message comes ~11 ms later.
> 
> About 1 boot out of 3 stalls or hangs. With cpuidle.off=1, or
> with commit 65705b18162b ("cpuidle: psci: Move initialization a bit
> earlier in the boot sequence") reverted, 10 out of 10 boots are fine.

Hmmm, nothing happened here. Might have fallen through the cracks, so
maybe this mail will get thing rolling. If not, I'd suggest you submit a
revert.

Or was there progress or even a fix and I just missed it?

Ciao, Thorsten

> I haven't dug into it much. The stall seems to be in
> pl330_driver_init(), so my guess is that it is related to the AMBA bus
> reading the ID registers of the CoreSight ETMs while a CPU is already
> in cpu_pd_wait, but I may well be wrong.
> 
> Any idea?
> 
> #regzbot introduced: 65705b18162b
> 
> Thanks,
> Dario


