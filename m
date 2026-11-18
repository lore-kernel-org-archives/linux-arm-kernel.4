Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E91606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kezzyqCv;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gCRGkF0E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=; b=kezzyqCvQLK252
	+vjJQpPDnhT5oqZffuPTZW+fkd/f2nP216E0knMjc1gOcHRnydBvseTD7MnQWHNxDPkm+5BDREysz
	loaYOI1OZxV+I7/KuIyiAAx+n0oTYO1jCvIN/ULtO2gHcGp4F4+/NZTOVr+t+EjIk3AsVqQA3fWxy
	tw/b78dIsyDKtLCy5DPcccqb9POVQ7vWkXK04WlrKDJz//MnEawLEqxgrMCY/MgHPUszwVPYS/lcR
	7Tz42VHEJIdlkletXH/7b/tDC/7ABFadvdNbLV9JizDXlsJEka0DIKKwI5I4F0ZNt31QRpi0o/hfE
	UcQ478/wyUtNtWX/B7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThPT-00000009DLX-3FZC;
	Wed, 18 Nov 2026 15:17:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThP8-00000009DFb-1Oua
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:17:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-491971ac844so1091537f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795015016; x=1795619816; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
        b=gCRGkF0EuCaVzxhE1TQmzp7fIhELXJEFwM7HxXgFedyEzBRPCUwGqBXtjdCewRTUhZ
         m7HmZvJqMaDqfY41+y7z8HsH/jPK3IBYeBX3G/ngYctz+A1aFlKNcr3ZOdgSzXV9/7K9
         C1bC1uxiTzuErrrXK88Sk2O8YeU9lGqG/Jevn5t/Ly7g9t0GG3eIrZ1Oa1i/CzKLpxfB
         VFIlNWttvC0LsaFaYYRFdWITg8q5KTyTbKoomZmpgt0odKnpYACJ2Ianjc4XkK3pu+o7
         DfkNIG/Y79RniGVrDnrOCv96GQcPNm3DXlXvQMk1awrnEiYKWh64le/mBfnYd0cWOJ4g
         4iOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015016; x=1795619816;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOY+wdV3n8VmzgrzAHcUOOBb9IyWYRHS3lQymwFtS30=;
        b=lYM9xQ4WSaVzeqMSCyUnNh6i09QxinJe23lS5yT0ndxtjQBiLYT0ocM7Ocz1nqoRks
         n7solpKnD55KPQBlcZ7kHFt4qDB5F7CW2lERUt7SAL7O0ljCJ+TbTSfc5LW2GbeXctyj
         qPdRH4UUfA2aHRcFiOjJqEcybTQNEZdmGf2x6prFZSiD6MZcYKxVYAOnQAHxq6E3y+of
         7YMzfwz+nygxmtWgXvqfg3AQu+3ca16TxLZKXovEYU2rm3/ewFqWygs4owh/bbf+NbsR
         Et7DypIRlIXFT4/OpFpGW4mu3hXMfoTrvLFux8h5cI4yfxaivot9emW4zsUuPtoa+TM5
         TTWQ==
X-Forwarded-Encrypted: i=1; AL+hErGQyGjlvp3r/gp8/5YVaQlIeUYzNeHaAgjqYuiIlRtTtUpx5gI/LS+AKssSTG0vqs1rQ05gAVXS4LEvwFBwCewI@lists.infradead.org
X-Gm-Message-State: APuU4Z/c+QUqpwekcJNl22/fplQZHDjJ0R+XHqDDn7blsslzAxs+je/V
	795NsLsSNiCDYV4yZ/9WANlMdNCMF0RqLvqdmy75SX7WsAp93jjfmEnvU8mh0gwCFZhaHxiXXxM
	SdURU
X-Gm-Gg: AZFdTZfYrEC3L+4nt9vExteujobqeFfpcdkbWblMzi6ZdHR5DczgRE8zWCT7eTbLCf1
	UIF5teP0Xj8JzSWMoEK4/rGb7kESWgbqWKHXSR5f1FTuydQyACoO6ZCYfKUROj6YUoR7K7LxsOZ
	siojPG4NlsBgguMHr7p4DORxFnZG0qZfL9nsyQwosKtz7Lbyxv6Ih4sYjhqAsNc5CKHGUxejoEu
	5w8+N0II3PVdI8gaNp18rnycdobuSvrBpQ++c8OR3jq3eeB4WTHtUMoJOegPB6uMvC0kEeGTxtM
	ROtzT4cWG+RgTucmZ7RcSTLqYBja6c8cqkyEwJWUv0STAM6CGZ79w9Oy3L5ijuVbyZKBGpu+FBs
	fJKgykVw48hZutP+KaVuWdckaU8cDy/EeSUjApxtTuHLvGaHOFcIQvPNfi7yDsciAHTrOK96Zid
	2kPtV6CIp5idF5nGsVNQoGFUv6JKgRY2mApNnCjMxNnm949TSjjQOcbsUa/YK046iRgJSi+BxZ4
	FAHUVuOIWQanuCJ+WzkIf8TcvmIikpbfuA+5evEOxUPxQxYtx2rW5LDYWsU0R2092j/O/ZAFjov
	9z3z0NEOmGtZ5frDKWxYvot4RHASPRmGYQ0tWnf01zgYCX0R
X-Received: by 2002:a05:6000:22c5:b0:4a6:ed6f:7a6d with SMTP id ffacd0b85a97d-4a6ed6f7c2dmr4688498f8f.28.1795015015881;
        Wed, 18 Nov 2026 07:16:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2f682sm5148396f8f.6.2026.11.18.07.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:16:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v11 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, stable@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
Date: Wed, 18 Nov 2026 16:16:50 +0100
Message-Id: <179501501070.639563.9357303541273366380.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ze/lWMxenuMFFinRWmaSX0IcexmH1tvXM9t0DvMowcU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/D6bpy/0tV5+lWL51RkjKPQXn58FtMoH+f5SuWOVVn
 Q0z+7iko5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5Z8bwP3716cfT9okus2OZ
 8K++LlbF6Pn25IUzVn3Zf0aba1HEyhhGhjdSSyMeLDnMVr/5vvLSWKM/unu682QdT776tVq3cnv
 vJwYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_071700_097693_D40AE884 
X-CRM114-Status: GOOD (  18.61  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> I am in possession of an MA35D1 NuMaker board. The SPI controller has
> been contributed, but at this stage it does not work with the current
> clock driver.
> 
> The clock controller registers its muxes with .fw_name parent data,
> which requires every internal clock name to be declared in the DT. As
> the DT does not declare them, all parent lookups fail: muxes end up
> registered as root clocks and most peripherals read a zero rate.
> 
> This conversion exposed a first issue with the WDT/WWDT parents which
> were actually missing in the clock driver. I am not using these clocks
> myself but it is worth fixing.
> 
> The second round of reviews raised another problem with the
> crystals. HXT and LXT are external crystal oscillators wired on the
> board, while HIRC and LIRC are on-chip RC oscillators. HXT was described
> whereas LXT was not. The series now also takes the two crystal inputs
> from the DT: they get documented in the bindings, described in the
> boards and looked up by the driver (with a fallback for backward
> compatibility).

Hi Miquel,

We've had to base clk-next on v7.4-rc2 because it carries a treewide change
around devm_kzalloc. This was triggering a lot of conflict in linux-next.

I did not look at your series yet but it does not apply cleanly on patch 3
(maybe others too) because of the same change. Would you mind rebasing on -rc2
or clk-next please ?

https://sashingci-clk.liltaz.com/builds/555/steps/3

-- 
Jerome


