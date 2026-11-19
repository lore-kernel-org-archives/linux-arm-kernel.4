Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2887606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ehb5FwqS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lI5EMDu5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=; b=Ehb5FwqSCeefSS
	6kxriUuQZx4BkugJxK/n7/FiZ5AIgw5jnr/eNzNY7CsqL7y+tQ4dxeBdKvUjeX9Kr6VPRcU+IiDVx
	nky9VmANk1Y35OX2yQyowHRS+hF9rajm9dJaDHsLPj544xI46L5Cy16HBB235GRi6dcjhLSyJNShQ
	PIwvFRGjFYtSPZhS3fq5OgRfbhOZdUaTin4QuSFTCnUkW7gS41WCOP/NzBuE9W8XOhHGnF6eRb+NJ
	LReAPbjSf34MUMHpwAuAm8N7ididtMFxCdrBT0Hx+UJzADWtl1Cb5fRhdJc7SnAmn5pk4rrUnr4SI
	ODpaSNt/TMqT2kTxqTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6XE-0000000Cx6g-28Qj;
	Thu, 19 Nov 2026 18:07:00 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6XB-0000000Cx6B-2hme
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:06:58 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-4b563403c7eso34997fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111616; x=1795716416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=;
        b=lI5EMDu5TMgfZTwMVV+tFVj1KKq+gqqZoxtjdpCe0rb36mMdo/u4kfRxc+G7a2jfnx
         s8xc1O9ErU+DCi2+Tq2qNSRIZTo6JXbFJpGolt2+024oh+6QQ0cw5Nmxk7jrocJr89yM
         eus9JVpap7XudozNQcbiGwPPRDIumI4qXQiRskaRbHXSKd0VABDQ4lxX9N0Q1/UkUKzl
         QtqcmRxzBASvml1YUWv2Ppkc/PjuEALWWXoHGwQawZpMv/FQMOFMvD5ZgmVLGoD5+tVM
         oV2dKI9DVWl33HwlXEKg3YZMqhZeEp5wJ7HAxT1VxTULZPuDECzLnWy75BlkAg3/O3Au
         8Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111616; x=1795716416;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=;
        b=1bxyNg/6cyDccuw4d/woIHP1EDr6CsuAgNCX2aJsRjL3gZD7B19wrSjemSv8O2Quy7
         IK9nLDql3xmm9BC/ag2+k/WELL6HtN4a52yTdm7jszIoxGy74HIZC36Tw3Rk+IT5Mffn
         lbY2uDfIn+rPWkp4IBSXZXBGAc6k+YXe1ADXqFeRFwBktj5YpR2OJNacb2V8NuuRIF2F
         bGq74I3b3bGvCnDHwsUg7+NfLTdV36dlEXJ3LWpl6Np21+EmyK3/GlDeS6qMJtXzbsb4
         MslzzNkciCaieN9y1lZhypk5yGcetNGuGO8CdGifHuxDHY5FvIgSsiFR/WZKWPYvW9lR
         CJtw==
X-Forwarded-Encrypted: i=1; AL+hErF1DMNsLKUXTQTy7pYcPerppOBZnrUmeefRbAmS+GLNMLWxVFoTkLSvHU5cIzbZBLEviB/697HHMlW2mwW//Bs+@lists.infradead.org
X-Gm-Message-State: APuU4Z8+AJwhmPGaLd02a9sh9jtZzofGXOPtJI0bYdg1xjHMuGEmq5tL
	kx/rQZdB7bbr0C55TCgeZXkTzqduJdgSvGB5bRmMKByrP8v3o0+MLycj
X-Gm-Gg: AYBFou0hCwlVKY7kkP831wLREqlO3k0OtgLS9LA49VbEs0v04FQVSMxC8mGO2Pbyy8c
	fYA1a2ad5aHkilIn580614CJG29SwyFhFMltpVi6IN0D31UzRGmTgPIsZGSIh2NyERBJ4V8S+rp
	hngwWZj2RSdNgyN4WB7cf0JvDswjJuQWWHkZHHw6W9jiPrdPmt4uq1MbV4/6LfcELILvGQ5np12
	Mq5UOC0C4UxIuesv8MFwjn5Gpp0daB480F4fDEGw8aegEXrfbhHpawiYx/vopf3u0CxFI1IyHsQ
	T9NpIQsHyVrTRFiKcqguMQscpfgZTiVRcTW+byZ2t3Q8IjdtrwaD92jhQX1pHZJagkqAcHM3y9M
	KGkhXXUfXHjxnUocn03YFCyvp58kHG6gu9AvTwZf63aV/qTpkO/Ndw9llYiyp33RO3k9enipFQW
	Fbe0yM4AboBbB6lMCMg0nzbqoG/nA7wd9d/OcQNjf2az7phlhUaRQWNgtN4KdsmvHdTbdSH9OSn
	/EaJxVVpII8m37VeQDmyfXtoiQFe5EMR8nmMewqeOfiavGw5plDB+C2BQ7tABB6SZ2an4H+9uJq
	p5HwEbplLYPOCM4IG4aMAjNNOmuJXTolcQq+eR7yEJq4vqYkI7doosq5UCYURLum7uMsU6DMstz
	zYw==
X-Received: by 2002:a05:6870:ac13:b0:4bb:98d6:f37c with SMTP id 586e51a60fabf-4bc81ca0dbemr415502fac.15.1795111615833;
        Thu, 19 Nov 2026 10:06:55 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fcb19a9sm453262fac.10.2026.11.19.10.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:06:55 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alex@sverdlin.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Thu, 19 Nov 2026 13:06:53 -0500
Message-ID: <20261118-a733-dt-v3-2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <18a78cddfc3c28c011bb5d0c566c2f307773b235.camel@sverdlin.org>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com> <18a78cddfc3c28c011bb5d0c566c2f307773b235.camel@sverdlin.org>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100657_712255_1AD2E440 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexander,

> Shall parts of this go below "---" as history/changelog?

Yes. In v4 I will move the dated test results below "---" and keep
the hardware rationale in the commit message.

> Do we need capacity-dmips-mhz, cpu-map and two PMUs here, similar
> to rk3588-base.dtsi? This in turn would mean ppi-partitions with
> #interrupt-cells = <4> in GIC?

The A733 manual shows one DynamIQ cluster with six Cortex-A55 cores
(0-5) and two Cortex-A76 cores (6-7) sharing L3 (section 5.1.2,
figure 5-1). Every core's PMU interrupt is PPI 7 (section 12.2.3,
table 12-1).

In v4 I will add a single-cluster cpu-map and separate
arm,cortex-a55-pmu and arm,cortex-a76-pmu nodes on PPI 7 with
ppi-partitions, and switch the GIC to #interrupt-cells = <4>, as
MT8186 does for the same six-plus-two layout.

I will leave capacity-dmips-mhz out until measured on A733. Radxa's
BSP uses 430/1024 without a stated method. In the November 18
RAM boot on Cubie A7S with the v4 DT, CPUs 0-7 were in one cluster,
with the A55 PMU on CPUs 0-5 and the A76 PMU on CPUs 6-7 counting
and receiving PPI 7 overflow interrupts on each CPU.

Thanks,
Enzo

