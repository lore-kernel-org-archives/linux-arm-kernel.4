Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D9606D835
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VVaqIa16;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9e511v6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yB3F3iURSo2op220m5n6KYAkOCelQKBFVJEduVBmqr4=; b=VVaqIa16rRX955PDqSswicVQ0E
	qi94VWZs8dTbw852j7OGABJtNdf1KuYbmDkou7V6+mqU1Dr2+b4v0TU07kDnhIL68CHXlSBKYjS2V
	ybamSaPieJtFHo4bHpArKbMKkvNnG96InQaDd42fl/0LecalPzgfam3NvhnjoT2INNF0PnxzFySoe
	Zem4vJrTJfmZLbmkT2aMRl6hjshAQySP/HdF5+WgSbq6zywz4cGBenARFyxKeWsvhfuRQPm0wwQw9
	L9zoNHmCnxunNynJwpdKC6NPkJdCJjQZegRYPzv5T087ZT1itig675naJykVTRwXLX3YkG1uCgqQc
	FdQxvOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhl-0000000F3FE-2754;
	Sat, 07 Nov 2026 16:55:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhi-0000000F3Dt-2olS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:55:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48b001cd92bso824855f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070544; x=1794675344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yB3F3iURSo2op220m5n6KYAkOCelQKBFVJEduVBmqr4=;
        b=L9e511v6P2fAQNliRv8hVE4aXS9mAZSnQNsCNRudwdPgl9Mbrk4wFFzHvfbp/RSJ3z
         +XPQfN6YejvHzpZZjLtQQuEww1iO/q8mW4+Fge2WYMhtyKVKupUZElA2pIfc1D8A5gnK
         4rozz+CKsONVkScXEn7l/eeZ4Bgl34M1lQDycGoL91YuoQOhgeovebyWVWBMJs7uQ6Ji
         FSVBtEsbIUEbHa6jzonJaJsT5JbyMnfxy9/WWU+xnasHg6KPMnHmsVvGrWmTrg50atAV
         RFipQ2pTJvvykg0ChcyHXrTvqzvK+u+7RJ3xV2VOXEc7d09WBBwam+0iD7v/oWt27C3Y
         pNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070544; x=1794675344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yB3F3iURSo2op220m5n6KYAkOCelQKBFVJEduVBmqr4=;
        b=2PwMgSWrc6Nf1a3WyBiHlylOXkEKfuyNFj2XFNflnnixMvBx/Z9yD7IR1CuCi7A/ZL
         W8eeguKQEAcbOx5iITCKlD9SHSDJ+DGI7Xep6C+p0p8D1x1xYr2aA+Bk2OdMKzXrNGVa
         VG9FDoRZKLQLyyoMIzbAx1xqEEI9fHQPVsE4e2qZo3dNPPvA+SAjXFfuAOZy7BgSj8v7
         76BQvmJj/L4WFHTcxyASYm+9w2A9RNvF7r8CCpNW+ScJzDzoHpw4TEDa18TJaoJiMCyP
         MgJIM4X+RIOIVC+8pa6wm6d1lU83sKjNjUXUVOq69V2pWWtTZWSKBKddwvUyUkEB61Dh
         GrfQ==
X-Forwarded-Encrypted: i=1; AL+hErG1/sQBwc8O7Ixhw0LiG2E3o3vPZ5htwAXuFcQonuSTkWveH1Wc7dKicLNL132PWp4cIzeqtGrPH3bCA6yaxqiD@lists.infradead.org
X-Gm-Message-State: APuU4Z8eQx+SaRb4d2yPHIxn5bt71b4lEUFRjH51JxYPsdM5cG4TiegW
	ai+Fd8sAJE+Dj5ufReINT0TBcZhx+8FMsy0qARogHjMD210Chi1uBVlj
X-Gm-Gg: AYBFou3hL0OG+IOmL+qj5EI+hMSZI5tHLwinmu9Vg7bG9qDqG5ohzItDJfAXVctqvot
	K5b1P1kF/DcUUtb4W2lH4F0BfAjDNyu03ObJY0e7ixihm1733Ipx2Iv+IqKNeu1vP2HD7Ow7M02
	zNST09KpZe0FJlqUUqD71HnG19gs3+CjBIpFHYSaGCwMQt2/Y+A2Cr85SLPBiVdmaOSPgqQ1HBp
	XSiM5V5Yl0DkTUn82vDzo/JzSGOXLzh3OK4xleGTkNkL/Qs5jIj2eFXfNJVEqC0LbBYgAppms6x
	2weCE9I7JufpaowmAju0qKbYaRDpRjA6qJK7xAb9bLMhPuNUp5t+ZbRMDM9EWylGaeHpXOm+CZ/
	K5vFGsKO+9oBBT6jBbcVPrnVVZtTROyKTapHavhBaSz7G/7nEKH50lMufUu7lWy0t8aM1gzDBBF
	MYa0Rt9SZr8zlSJdNt3HFC9JT+wLf5z5lWveNLAaRNYaBHv1LLfTykH/KeSGCeSAOuAsE9nbyrM
	W7H8h54XutXTbnprXuhHvGFFKNaXIW7qA1jWu9Ckewm5/qMWUD8Vht0719kA04FUFYfrqFHhcwt
	b+x0/kgzLWY3OTOakS3ZG/+WdBB9rPz0Ig==
X-Received: by 2002:a5d:5d82:0:b0:48e:6092:dea1 with SMTP id ffacd0b85a97d-49277bb30fcmr10474276f8f.47.1794070543659;
        Sat, 07 Nov 2026 08:55:43 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:43 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
Date: Sat,  7 Nov 2026 17:55:23 +0100
Message-ID: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085546_715409_1F6360CE 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Each of these drivers can be built into vmlinux while the code
providing a symbol it calls is a module, which fails to link.  The
same shape in 4 drivers, so they are here as one series.

Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.

The fix is a select rather than a depends on: the providers have no
prompt of their own and are only ever enabled by a select, so a
depends on would leave these drivers unselectable.

Each was reproduced on v7.3, arm64 by a vmlinux link that failed on the
named symbol, and each links once the select is added.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

Jude Gyimah (4):
  ASoC: meson: aiu: select REGMAP_MMIO
  ASoC: meson: axg-pdm: select REGMAP_MMIO
  ASoC: meson: axg-spdifin: select REGMAP_MMIO
  ASoC: meson: axg-spdifout: select REGMAP_MMIO

 sound/soc/meson/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0


