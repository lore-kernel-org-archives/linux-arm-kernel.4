Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73548606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zre7tZyb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KqsYgzJJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=; b=zre7tZyb2WJ31V3Snfo7JGVYrm
	VXh/Qhisillr9W6XDpGymV2zHwu4r6KwosDtRqau3hJuevasgxDO4Fom3YFw6PXd+HtXtDL9HJsHt
	rBA0DG0z6HDh/mI1Z27mf45fGyc++Zph4OrESCXx0iW7Y6QQxy0LpmLkfloSfRIufNEPxfSnnuAB7
	I0WuS9GIeB00dmFqJnAVlvSKGGW05BHAy2fajfVoi+1lQPKc9JAFX0qrd373zfbgE7Gor4FKgLvvF
	FMyRCQO/WvrkN/IwDpUdWsIfZq5Herfq61x6Rct+NTtTyfSrtdEZWGnQtz0JMYKsF1S1uA85GWQm7
	pqS09o1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoQ-0000000FHkR-3ZOj;
	Fri, 20 Nov 2026 14:42:02 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoN-0000000FHjg-43Db
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:42:01 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2e9d7791b00so8526045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185719; x=1795790519; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=;
        b=KqsYgzJJzmSjMXfDQieNgKKewfLaLcd0ppNxo08H+BZaMJ1mFU44yrRP8YBQZhR9cP
         x0VH1tUsTxIEn2CzkVVlRc8Z6v3L4AZSwW5QnYCopojUchrp9PhAoSVfiB5Depav8o6P
         qhgLinBP0jEt1GE9shuLq7rwvngwyKcPR2cdUoPUfcwiQ8UynlANB6BCmD1gYRAoNjR5
         Gr2SjMZ0ysn9buT9L1T2tDI6WhCbuaQJ7XrWjpZyyFJT1/+RaK0i97I/sCadW54/ZsLw
         dqjXkfgLIVSUPyabh9C1d2E215XJzsI6MtbplLYrkC4YLNUd46f9+FpkdoqeiO1LKNDI
         xkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185719; x=1795790519;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lFlzAKdCGrD9wxKqRyhdQN6B9b50cNxrDOsT/MG3sjE=;
        b=mEH+CNdn7Iy9VlzbofbpXxLd/3AzB+SlTmsC/lOlHmklrHRTXq8mHRcufWmfGhCN39
         q4+7s4yhUfojkvuwNoPhIYvkp2ffy/umJGuomz8ZP8IX18BXV2h68AGWO5oqz4EXNSrY
         2qi8eIoJzL/xwLxVcFebowZLOIBJc6gVOnfPZUmoUfkzVbbW41XOTAfIGllU8spkitY9
         KBRtnKuL3QBc5F2mjVURLIsSjKe4ewj2tJMRdmdGFYUNBaGXawvfPSE6SSsG17hTv5Z/
         +i8GAmRhQWH8Zhtza4IAva9Kdft81cF82X8JC9wxjubKrcq0Bc5pJZU4B1VC4k6lDcNR
         5uzw==
X-Forwarded-Encrypted: i=1; AL+hErG4at0eTHUNJjU83nWb3BrrTPgbHGA9U6cq8X2Rkp71WqyVgVpY5qh703fBjTDQ4KGYvmPbrwJNZT1ngMhhJQNB@lists.infradead.org
X-Gm-Message-State: APuU4Z+s77hxS6+dzHNvI1khl8f/nBHjy3XDtWb2DQeKP1xggmalJMYd
	azVICDgycrLBlKCoG9xt63AoEWS56jrtmleLji1OEf4lC/JJwRAjKLiy
X-Gm-Gg: AZFdTZdNoj+DSDBAwrQo45NU7/jYyt4pN2A6HABgLP3+NoLbpMrnW8owehfMeCo2f94
	E8dETqYy9WZRHNTQjdnEu2TcLa0QA+q8L4cbnW8lMZRw4TNIkVljHtk+THIaKRxXaOlI1rKmM6a
	EPVKJBq9ZUoWKz4oswRs110QYBSvG1Uw/pMY0ZfTPF5MGW9UJxh6gsTNmlIetg5QwkVSSpcZ/e0
	HFPzr+8WNPJoIhyRjUuM3kmhS7E1t27x3v/TqNGsAaWwK62fJPNcmExiLebW5rxQ+3DFfUos5T6
	T047rzFc5bCVdoPlnJ0/PNtlVPjTcIbDphBCVUNR1FnQ/srVcYdWZHTOH504EIofBTWGz9KKkbW
	S0IbT4sGh+DXIgkJ+nrBQPb7P0MZTwkpKYqLT+lWUPiRlN9MmMnim8/iYkPEFCq7tkBJ2jc4HDq
	9Z15E3SP1zp6V1nttSAeEOEPPo+hF1D0ZAQMk2iFk0X0UrHhx66YLIed1hezIrChfPZ7M5mMIjE
	t4dRNTXgJnBEAgo1wMAOJlU6gCFR40gkomyWZkNpHl5XuOD4649cUgD+DldmhKKtElH1/6kGIkF
	JmZwXUl26yzZtrYbpb1QiBEFfQI56arwboGKBWbq
X-Received: by 2002:a17:902:db08:b0:2f0:3e48:8cdd with SMTP id d9443c01a7336-2f03f16acc0mr33951835ad.46.1795185718476;
        Fri, 20 Nov 2026 06:41:58 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:41:58 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH v2 0/3] Add MT7629 RTC clock selection
Date: Fri, 20 Nov 2026 22:41:43 +0800
Message-Id: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/13NQQ6DIBCF4auQWTsNQ5WCq96jcQGISlK1AWJsj
 HdvcNn9e/93QPIx+AQtOyD6LaSwLtAyUTFwk1lGj6GHloHgQnItJNoa5/yQQmPMDh+1UoPRtSV
 joWLwiX4I+9V7dRUDa5JHG83iplJZ/J6xpIhIl/0UUl7j9+I3Kq9LIs7/pY2Qo28aeVeyHxTJ5
 zib8L65dYbuPM8f34Co78oAAAA=
X-Change-ID: 20260926-b4-mt7629-rtc-7488fa94b1ab
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_064200_065117_64923B13 
X-CRM114-Status: GOOD (  11.75  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MT7629 RTC mux can select the 40 MHz crystal divided by 1024 or
1221. The integrated Wi-Fi needs the /1221 source, but the clock
driver currently exposes only the /1024 source.

First move the clock counts used by clk-mt7629.c out of the DT binding
header and into the driver. Then add clock IDs, the /1221 fixed-factor
clock and the RTC mux to allow selection of the approximately 32.76 kHz
source from device tree.

---
Changes in v2:
- Add a preparatory patch to move the TOP, INFRA, PERI and APMIXED
  clock counts from the DT binding header into clk-mt7629.c.
- Update CLK_TOP_NR_CLK in the driver patch instead of the binding patch.
- Rebase onto next-20261119.
- Link to v1: https://lore.kernel.org/r/20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com

---
Chuanhong Guo (3):
      clk: mediatek: mt7629: move clock counts out of DT bindings
      dt-bindings: clock: mediatek: mt7629: add RTC clock IDs
      clk: mediatek: mt7629: add RTC clock selection

 drivers/clk/mediatek/clk-mt7629.c      | 12 ++++++++++++
 include/dt-bindings/clock/mt7629-clk.h |  6 ++----
 2 files changed, 14 insertions(+), 4 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20260926-b4-mt7629-rtc-7488fa94b1ab

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


