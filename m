Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A83606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oTQPiCdD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gK8jig75
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bPhouWL64Ss7xA+3PtWE37jW1mEzq4J5HXL5n/CanOg=; b=oTQPiCdDa1XF0i
	1VJH7EsR+mSScPGPraJuyqFxaauP/dFzoCkqmbdbvcT2FKCewEpTkS1MgeoYJFpnj6XkBFCQQKN/a
	tMfTbnecwsrxB+3e3iA0dVPGXoY/55TEzaKMl1D+FyaIyg8IKyPMzcg7tefFohfEuUIOWDcpotHaT
	v6YKetRPGXk2Bv5GgzzTqTGdU4xINXW5HEuXLvAQAhP3+x3mn7aFZJc6nNWuy+7HsItr7NnWaCcgy
	LbVLe4iaikHbc4yY4nFf1ceTO3oJGb+b8NUhgngJcYGqZr+AUvNVsOVTGnbS83WzpA3jF6TDsYZ9A
	BiY0UKsl15SjC+AbCYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrFq-0000000CuWQ-3BMF;
	Fri, 13 Nov 2026 13:23:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrFj-0000000CuP1-00R5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:23:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so10344595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576217; x=1795181017; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bPhouWL64Ss7xA+3PtWE37jW1mEzq4J5HXL5n/CanOg=;
        b=gK8jig75ZgI701ePh70qa9edXsST5TY2TIUB9LWrANrXxfEO+eLAXnLwy1TF90ajSw
         l3Q/R2WDpGo9OPp3ItIAnT+1f8BArmb9VfLvizHfvNirInFiKUzhwgy3BAjgtKGpKnNg
         8/A/90d0nm+tu3s2NQIcK2owYiRLYz1uTp9iCYrBto54QTixJwYNvtNEgnFmuAulmcin
         cbVgtmov45PS7KUlgos/gnOfXzwjA4z1rF9fI5acJRZLVcExnfbAtpL7eiKydVN5jr2v
         3W4291uk9x+06Tw4Dpx4v0ujiOeIheWCNI+JjGyUzKH2NuaVCe1kD4JiNqd0O6sVSNTF
         kI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576217; x=1795181017;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPhouWL64Ss7xA+3PtWE37jW1mEzq4J5HXL5n/CanOg=;
        b=LRAdQk9Oo6sa61koN3c04MapFxKJzj1TXzhltcGIak6aW88mzrH448x5Mp81Acwbwk
         ZyFm6TA60virYckYBDI+i+ejlGGvkA8txeaZz71XFJ6ZDcX6Za/aWGTDUVRx5a1pBfRh
         T5e2TOU4UH0DOYAHGyU7F54hdm+VIBN0YNla5WvTSJJYO/UmltklA7ULOfo5Cx53jgQY
         2eTCJU9FkOZW7bgEXc5hLe5C19d/dsfeIukB56caEDoaVIYp6YiAGqITTNmenVWjxynO
         TgxtwQPsoC3AYOJlad7q9U9IVOKN1OVBpcupSAgs6ZhnX4xgrkmkf8zM2PJ7HuWfYnt9
         C7kg==
X-Forwarded-Encrypted: i=1; AL+hErHTHXbdFjBmKuTvgPX2g5miiYsbpbIroXaKLTS5vdn8RtH5l5Gwtd1NxOoH0eRKCslzze4TSfFfgwwTepc4B0Hd@lists.infradead.org
X-Gm-Message-State: APuU4Z9xIhRYP4qmuCuk0jCEMur9yt1uu1KYocph28jiFUxDa0t/aLEe
	UbjCOHH4Wa1XIqRbloh41i60hVptDz41hSZb79OBNi5YQ15K8haen52c
X-Gm-Gg: AYBFou3PST5phOXRpaWXuELEGc/RqQG7qWxjnm2yusOkCyThVjySDroA+g28oH6+0yE
	5si/R3Oc58Ox7QBKUXou5TFf841xIsNJZAfXkF3E5UeKKWHLsD/MrlAsqx60qIURCQTL/BoYxkh
	YvloQq0SzcsPMKGqslV6vZfkrtAc0UuWcGHtGIft5wn0QPxAFWNlrk8Oos+dIcpswatrfqUdo3O
	vPozlcBeYOOX4Zs+0sS2bt2GAFL77EwwkW9WlHBzLLpcy66YHxdXFWX9YZEmewLDgNC2mMwsyuv
	RDaQwQR7yzPEpo0mylDdbAPD12B3fYn1l/4MgNxumolUos53wr6OihXTcr8jNkG3gwpDNfVfptN
	mDLuN9/oy0F4fzqCfwfdIZbcusXam/QP2BFYWxFGiD62chAfPTzmCAy0w8JJrCcDxur65XlqNem
	CnsKvkwBfLMWiQz/77677wkzLsbhZRpVHwOm24tR6JSiiBREZ2OdL6Qk7R5sZs8Ldv3lEh1odRf
	8ZRDN7077DfF588Jy+wSK4+Z6OiWytyx2MKDrTpjoVMh675QvIs2jJbhLpiBJyyi3GrEStNr65a
	9mwq9CerYg4dQFCFDOov29TcYsJGgAXlGAFCiNlJ6H7ZHPq0QycYARTMkJZTpuoF3Oicmo9bHcQ
	=
X-Received: by 2002:a05:600c:8010:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb55a6a5f0mr53609575e9.19.1794576216701;
        Fri, 13 Nov 2026 05:23:36 -0800 (PST)
Received: from vlw-PC.. (static.18.103.245.188.clients.your-server.de. [188.245.103.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e284339sm136419825e9.5.2026.11.13.05.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:23:36 -0800 (PST)
From: Vladimir Bely <vlwwwwww@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: heiko@sntech.de,
	ulfh@kernel.org,
	finley.xiao@rock-chips.com,
	zhangqing@rock-chips.com,
	abel.vesa@oss.qualcomm.com,
	tomeu@tomeuvizoso.net,
	royalnet026@gmail.com,
	sebastian.reichel@collabora.com,
	shawn.lin@rock-chips.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 09/16] pmdomain: rockchip: add optional per-domain power-on settle delay
Date: Fri, 13 Nov 2026 16:23:22 +0300
Message-ID: <20261113132323.159015-1-vlwwwwww@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108065917.135194-10-gahing@gahingwoo.com>
References: <20261108065917.135194-1-gahing@gahingwoo.com> <20261108065917.135194-10-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052339_099758_467F27A9 
X-CRM114-Status: GOOD (  16.80  )
X-Spam-Score: 0.4 (/)
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 08, 2026 at 07:59:10PM +1300, Jiaxing Hu wrote:
> The NPU power domain is switched off when the driver probes, so the first
> power-on goes through this wait even when the bootloader left the NPU on.

[...]

> +	[RK3576_PD_NPU]		= DOMAIN_RK3576_R("npu",  0x0, BIT(0),  BIT(0), 0,       0x0, 0,       0,       0,       0,    false),

Hi Jiaxing,

(reply to https://lore.kernel.org/all/20261108065917.135194-10-gahing@gahingwoo.com/ )

This probe-time power-off hangs a board that does not enable the NPU.
I hit it with v14 as Armbian carries it on 7.3.3; v16 has the same
DOMAIN_RK3576_R("npu", ...), so I expect the same there, but I have not
run v16.

Board: FriendlyElec NanoPi R76S. Its DTS has no domain-supply on pd_npu
and the NPU nodes stay disabled. vdd_npu_s0 is RK806 dcdc-reg2,
regulator-boot-on, no consumers.

On about every second boot the SoC hangs hard ~30 s after start: no
oops, no answer to SysRq over the serial console, only the watchdog
gets it out. The last console line is "vdd_npu_s0: disabling" from
regulator_late_cleanup(). The kernel without the series (7.2.8) does
not hang. 10 boots each, no hang, with any of:

  - regulator_ignore_unused
  - regulator-always-on on vdd_npu_s0 only
  - the NPU enabled as in your ROCK 4D patch (domain-supply and
    npu-supply on vdd_npu_s0, cores and MMUs okay)

PMU registers after boot (regmap debugfs of 27380000.power-management):

               NPU not enabled   NPU enabled as on ROCK 4D
  0x110 req    0x000013e0        0x000013fe
  0x128 idle   0x000313e0        0x000313fe
  0x214 pwr    0x0000003e        0x000001fe
  0x230 stat   0x003e4181        0x01fe4181

With the NPU not enabled, nputop/npu0/npu1 (bits 6..8 at 0x214) are
still powered and their idle requests (bits 1..4 at 0x110) are not set,
while pm_genpd_summary lists npu, nputop, npu0 and npu1 as off-0 from
early boot.

My reading: rockchip_pm_add_one_domain() powers the parent "npu" domain
off at probe because of need_regulator, but the children U-Boot left on
are neither idled nor powered off first, and genpd then treats them as
off, so nothing cleans them up. When vdd_npu_s0 is cut later, the bus
hangs on those NIUs. I have not dumped the PMU on a kernel without the
series and have not tested a kernel fix, so this is a report rather
than a diagnosis. Idling and powering off the children that are on
before the parent at probe, or skipping the probe power-off when there
is no domain-supply, look like possible directions.

This would hit every RK3576 board that does not enable the NPU, which
is most of them.

More detail: https://github.com/gahingwoo/linux-rk3576-npu/issues/4
I am happy to test patches on the R76S; it has a serial console.

Thanks,
Vladimir

