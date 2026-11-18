Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03D160A2610
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c5DDf6fZ;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WSuYzESf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=; b=c5DDf6fZeuxqiJ
	QQueaRZO28p5PiD5pXuSSgqr7k7Vv7kOpGgV1qYEIHkY+bzmYtb40hUP0Wmexv6eSzK33Waylbxrt
	YK26AXC/CKeLU7hE/hzBkM9xMIAkvjdL9hYr1ZvwwoZYTPmN33e5NkvmYn3SvBZRlcOXiDY0Mn0lT
	t5gYAyDc18yFeaXtObs+nW78H3/qdVJUWQNuqKW2OtnBkRI535EF2VmIhEhwvb30TDzvyZ+S7VCru
	o/ZvR1SNO9M27wf7+n/9D/t/UfHsgEVqZiJkKlnNrotCKR83py95dyeDrFPkk5uCg8EAMcCY/3R0Q
	QbGlVVgVyCM+YnYQY12A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcTk-00000008TwU-3FNK;
	Wed, 18 Nov 2026 10:01:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcTh-00000008Tty-16bv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:01:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so539028f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996079; x=1795600879; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
        b=WSuYzESfL0bL6EK4SFY1ksePktZXKLEn5yY+V6BLhmh0YoaC3xXjqzPxGbM3WpQybz
         fal8wuFe4C3Txq0YGDtgRJTKJBkJzOgTJDuKqxWNxG6tphs9MEpKogInM9Ufr2Ddz7YD
         u59GsFotPCrspJsWiK8WbSrs3TE5/8LYMmza2sfeiycLCyrbeSXkD3oaQCZMMDjN9XUY
         uduJuo+PxRmrOq+w/FHhj5lJcfHNKAapstzLWyd419VtG31kF+kaaKrrVEcQ0SVe2AG0
         rOEPhBuVRVCWNno09z2h0zqqwPrbD78wIa1X1s+khkXnkv6CVwQ3JhsPf2x/gSp0mOA1
         zBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996079; x=1795600879;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
        b=HziVJXAliKGL0TbyYBOzYrmyG3tgWuwsJQ7slE8bMaEEOht5xuAw4d0ROCW5wwOCgn
         tHeSRxae4txulhXkn2CJfb3xbFQbyy2AKfQWnnNIUvMUajzuBT4xEy1gXswZzJvenlbS
         WxfDIN+tOiq2ft6cI8BPLXcNewHDVXSQzPQ56NAzvaaZkwpWnbekIQzSq1w1ptVFdhU4
         9rGQjI9V8bweqwnTmgekeXgpgTRS2FFJ8j/Ems/FFRyvDgWrsDzUo6s/GacAuKwNxhRW
         wvwDE/k3hZ7lqMNgS1H75SOIaq8V3OI7gq0nIr10lM1yw1Fo1Avnd8QfHru2ZRRijGww
         w+ZQ==
X-Forwarded-Encrypted: i=1; AL+hErFZ2kKcpgrkjk43bQoAQpZyp3eUYapfKjez/ZbW2Zv/FuYGUY/KBTHWrlrIQA8kltxN04QNr4UyblSec4u1jlV8@lists.infradead.org
X-Gm-Message-State: APuU4Z/T649XGCFRminOe9tdWG6e6iECZxdLHJDHLHy4GAaXHUVCdcjg
	aEcyNMh0PHkVhqgslXLCnhvORmhdAUtfuxJOfDzDMdBPeQgUwpaFwPIvDjGDsojOf30=
X-Gm-Gg: AZFdTZdz21QdtORHsqIo8fiAOklhGJ+7pd5PYXEpcLO0y+M47JGtDEE4R7e+E0abPxp
	bD7abU/BkvKaSCmJ+wbZr7b0dnXr/bfHVeA4fA8mQGF7ZUNKJZ44ZLIG0ph4H9dqUAc53SulIpi
	r5EYbi65lSL7uafspKVuFDXccTBgHn8XO2R2mQ0JXlX/glwg1EN2mmDo2AFG9gXBHdz9iji1bwE
	WxcabiDlW/0xQxdP7h0MOlihjeSxhig04I1Euf9kvH6qlteeEbIdGgy4q60WeimYXBg/cfPUJTz
	EvFFZfqGKXdx0YZpajOTGyuDzaYY8hhZxZ9EgUOxc4Poz/AaNx22dmgIu6v0SafJkb/KUSuotQR
	7mT2x7afEZKi4Mneb1EKM4CO5R+9ILVxfaYV12TFl0wwk0Kdywx2m7j1pwn4kcy10aHH/NuVd5Z
	zQPgWV3SGxBhUPtKAQxcbjL+zQSLFDGaIvjSuCq8t+K5zcz+7TNHA1pq5WVw9US3V2n7lLyauh3
	FBLAAY/In3IS6UWNCXcRfL0fFUHx/H6npB9bj4SLRowdEj0BFJvDF4nP3fwT6h5+a0+5Gh+k65n
	7lVV7FNtUhhZDQT24Ucik40+EkjmcK4Qxs6BIHvoQk6qYoYc
X-Received: by 2002:a05:6000:4812:b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4a63c0938c4mr4292105f8f.39.1794996078453;
        Wed, 18 Nov 2026 02:01:18 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100c6bfsm3712254f8f.2.2026.11.18.02.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/7] clk: meson: pll: Support PLLs without a
 pre-divider
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607255.413320.2562080050432015678.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5EHyC5MxoGvHsCcV/VC2od4aT2B3tCgL0d4UTk1LaZY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3OMtyjNXN+x6DPTga27pnxbX7qy1DfK8qqpoZ13x
 EfpYP64jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkRivDP5ujDMWqq/wiOi8w
 7dgxUSuhNjf2xpWV3VtVUp2rknN+XWdkeCgxYdb+ymrWX4mWglrTe08XrHBQCr18n71wQbN1tIY
 PKwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_020121_325973_1B3849D0 
X-CRM114-Status: GOOD (  13.12  )
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

> The common PLL code assumes that every PLL has a pre-divider. This
> does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
> meant to run with theirs set to 1.
> 
> Make the pre-divider optional so these PLLs can use the common
> implementation.
>

This change looks like the intermediate step Jian needed for its rework.
It leaves some problems open, like a PLL without a predivider could still
pass a prediv in its table which would lead to inconsistencies.

If I take it for the S7, I still expect Jian's to rework to be finalized
for the other SoCs. Note that I will not accept more SoC drivers using this
intermediate step until the rework is complete.

Regarding sashiko pre-existing issues, You are free to ignore those in the
context of this series but you are welcome to have a look at them, if you
want to.

-- 
Jerome


