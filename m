Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5D0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 05:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0lMPDiW3;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GOsJiRzL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=; b=0lMPDiW3bacKaEjRQAXzTCDGsF
	ThYtNv0U+qLjBoth7sAeBJTVsNxmUlVMf8+1B1RupLWT2nvbmHT6wjDf93xs+O9RM3I1VADR2zAQB
	dI2L1Kun45ka6og1539UqEMWHFBbybMhGG/vFsrjVSoINJMIDeaaQaCheT4pXAVuiEo7kyfEo2sX7
	QPQRKxd4t2kJ0epM+hxbyckDXlyGUM9Ljj5MpECRgMkvPGVG6ZzsZzp3+7WKulJYyxj+5cZHW9w14
	PXOGMSGoSUITMd4p0RLQrZUYfperSq83v6NWDB6CnazTnxN490EHyglWzfciAa+W6BV6rHwQ4tT6E
	+LpTlanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRl5-0000000C6Qi-2YFb;
	Thu, 26 Nov 2026 05:10:59 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRl2-0000000C6Pv-001r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 05:10:57 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1b3b4944a0eso5005862c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 21:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795669854; x=1796274654; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
        b=GOsJiRzL5iR1NYehTt5b7eNaerlrSVR0RWxbJfXveF/xEWQEyjEfWE73Xumd2Xs6l5
         AqM0mrvPLH7EcPaVYVz5XKDiI+UJEHYce/NvZlYxBr3EW2GKa9CNl2Y+bbd5C9pAYWnc
         RizkThp/ZFWTSTs0HfHer6BRxI0zL2xVscAb6KGpZxSrkEhmUsYMg6ToDpzJbc2UkaK4
         eZzlbL0lrxHUVvi5prWSaiAthbspVVZaCpbm2qz7d8gWEAhM+RTnc0w1Wnu0bO0r7mMV
         anaySD93hCDBbXYM4GOToqToRep1e2nPGduizPJKbbQNRcqBai7dRXdk+oUKIbhxoDhi
         QMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669854; x=1796274654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
        b=glbIffe6ncunUkpctuMTZtxc+rToE6ET554TFS4y40yz4+7v6Ebwg+yqEnxEiR6cQ/
         cpPN3lwZ2L9FJmjrrTDQIA0npibu73E+mdV5cnudU6I1DTa/OaZElbIuQBUkDhJxfrno
         Zw9vPAcApY/BTwn2jaT75Gigxe/2okt10t1oUW9o+IHDLNWBlfftSJe8v4X+9Au0TMf3
         LguwaFZJf0cqtF2ic57k03wNaX97xHaKbimIjzGkqJtPFH+/0pD4T//YKwtwWbqJaxfE
         PshsOgfINViHKrZLhMf6kVD1nCZaJDgVigv7FtpCb23Qjfk7nPSCLCfF3px1QtLIHCGd
         EZzw==
X-Forwarded-Encrypted: i=1; AL+hErF2W1cqD4I4NehzfQVUyMwj+oRIvjVJ+R4t1aWRPJuI/P4o4botCUcy6dLohDiF60TMtfVBwrVerWeNvMoGjw5q@lists.infradead.org
X-Gm-Message-State: APuU4Z9V3jJVK5zyc4KBeAokgk57PKQCqAaCYlgkvK5EZYkDzQ7yBKXx
	Y8yGT0f0i5cnGBkquEk/2yvzUap4Z+38ylX2VqsLNvZoxkRzDOA7BI7rrh2CBAAfhgY=
X-Gm-Gg: AZFdTZf4CNWNHQszYC44ZzkUQmgyGMHQ8PhtwQK3JpsSasler+/Qbp/CI9BHJyBgrXI
	TAqNJN1mYRdGxRtrciINpKXmN/PzHMvE+GMqnTqBmkJyjbOi3fF8owdpX402NiDUkxMlrDa7jX7
	EzqR3j0phn051Mq6tUWJxpGpRUyNsR2H4Wh1vA7z4O8nmQrPwuzhu4hAL0nRaUgg4LQZ9SyzhWw
	y3dlOkux6xt1YnkpwoEFz/csce7YnVTBGBA1n4LYgNt4TnrphyE94td7e1ylEkjF4b7hjfFoRji
	dJq5kJK21+zkmEtFFyaf0iFbSCshnwl5yk5Ybzhl5d2JD4Is/QojudD5zTqoza5hunYHFO2H02+
	yuTfpuDCridNh+Op8wcRpwvefjbeaOsu9WsK93AB5bREmD/kTS6Rmw2pxvme4gHunIPEseGqLxi
	jvEyY+QMmgKI94nhs5daatx7uNM8vPR1rTrGIr+hfgzRrofX8tCcmIlvL20T/Rww+9awU/T+aB0
	fXghfga3YpGnJsA9QB/q1PSpJ402GxouFoAGGMdcPqHjnsrn96XCnjOpAMNDaMedyd9ur/7kUil
	i18CRQUQVgm7wdFTNab+PKNt2q92Jg==
X-Received: by 2002:a05:7022:3f07:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1b5567b5685mr22918571c88.3.1795669853936;
        Wed, 25 Nov 2026 21:10:53 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm38643650c88.11.2026.11.25.21.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:10:53 -0800 (PST)
Date: Thu, 26 Nov 2026 10:40:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	christian.koever-draxl@student.uibk.ac.at,
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
References: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_211056_098498_8C4BCFF9 
X-CRM114-Status: GOOD (  11.54  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23-11-26, 20:23, Chuan Liu wrote:
> I have already completed the support on A9, but cpufreq-dt currently only
> supports the single-clock case, for example:
> dt_cpufreq_early_init()
>   ->dev_pm_opp_init_cpufreq_table()
>     ->dev_pm_opp_find_freq_ceil()
>       ->_find_key_ceil()
>         ->assert_single_clk()
> 
> set_target()
>   ->dev_pm_opp_set_rate()
>     ->_find_freq_ceil()
>       ->assert_single_clk()
> 
> Both of the interfaces above are limited to "single_clk", so SoCs that need
> to adjust the DSU clock in coordination with the CPU clock (such as SM1, S7,
> A9, etc. mentioned above) cannot directly work on top of cpufreq-dt.

Have you tried something like this ?

drivers/ufs/core/ufshcd.c:int ufshcd_opp_config_clks(struct device *dev, struct opp_table *opp_table,

Finding the right OPP should be done based on the primary clock only (right ?),
but configuring multiple clocks is possible via the OPP core.

-- 
viresh

