Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D2E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kB18bZzV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=buXKN1bD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lmmBhmNLI6X/YEoK3eoy0+dFw9XJT8YVwQjaeh+3Oek=; b=kB18bZzVmJnria5JFgG3dCVegQ
	9aLcHlzIwYZxdEFmFrzjb1zFBl+BEIyrdO7aBE8VJnH2wl8cCSCKZlqC5jK1tVOK5eQN2uXvEcsLu
	r4BSuOQ3bLLgQf8R/dyYX28lHmEvkhRStzb29Fbj6GXH2lkfiVPTDI4yILgEG/o/ojw8l7+239Kmo
	ydhFcdJg3GnKZP4SfLMLLVHTk6PoSPeN4Z0pNU2OgYdQL1yid28GktPvBHLwXgmBC0Zrj1g4DiMH2
	vJsG0X2dMvfVRaHuTQv/h++erUSbC5UHhtCGCBjxPif5D0BCuTMeZv2yFede/CessSbKKEwzRjohD
	DkD8pMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULTp-0000000EYnJ-31pA;
	Fri, 20 Nov 2026 10:04:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULTm-0000000EYmk-3tOt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:04:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2efd659464aso2382485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169066; x=1795773866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lmmBhmNLI6X/YEoK3eoy0+dFw9XJT8YVwQjaeh+3Oek=;
        b=buXKN1bDfAVu/dG92/jVgvIM9vRjZgyRtJ6xd0PYVIGZ2AoKYgYa8RF63Nsuq8kAod
         7O9copJ0iSHy1RTP5lOqN5uH16Z6QNIFOG3h4Q4qviTId4ePiyORqIzkPLqIT6CBa53W
         9MWzFOEhnauu7395kffBTbP3jK/k/IoRBCjEA14h0WFkeOBzH1gklx5CpXO6fH5KlfiT
         MZK7iJyRWbb0glmj9Wqek/4l5Ba3indHfklvR+oqVC2O/B++5VPxjz+td4CE+3C26jYc
         WuQHR1FaViQzXeq1KTZn+kXB5GVMvGxSi5JpmQpRw8pVWJB45XAUND7LVWjW9oFtFmQQ
         u9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169066; x=1795773866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmmBhmNLI6X/YEoK3eoy0+dFw9XJT8YVwQjaeh+3Oek=;
        b=obJfwvgpDzyt+X7pjzY2gRldfpXCXndK2h/UG+56BXB8EbrPEiXHzGC+ZcPKZTjlKo
         luSmIbe5vpBdM7IowJhCwpITHldtx+h5Uwz6LZ8398fKxn/rPB4pA00Y4F6SL4hL1e7g
         MBfFK01HWvfp+9KDXcJvChK8O76GDzOGR8I2X0+N0FqHpnTgM+C01Ih/TiKRBoEfahZ2
         /oc7ttToDyAv1yPkZPsqgek0c4fkqcsIsUsiwZQj3AyVN0KFby1M/M+Prcy0HwHXog/B
         DRDXtrFl1Ukix5+cQOuUz9ak2qcy890lZcMtLwNjOj4LDhMrIk3023HYFO3wG5YbPVlp
         P2mw==
X-Forwarded-Encrypted: i=1; AL+hErHublGzQMzYCiSngSxYyLSG7k2MMktZ4elDPecG+ieMoIHpspVhEG9s2bbwdTOy3fE81mvJzfpS+BJVmJb4arKZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+FUn5akFshndZQg6zTDyZcNJBtuMrm8Pz/JFWoCMbOScmIM+wq
	Cz2HKymu0D9KSfw+UtCS20ogDktAjZtbAqJwD90Yfx7TDBkaha1Ujon2UkFG8w==
X-Gm-Gg: AZFdTZdjtv68bgprihoVuoTSKpuNAke56TTujdDEROdh7HHvNIvrFLfKHpAAwdl+ei3
	njlAMwcIYCd8iEm6QpqT/Gv/+Z+OqQTjUJZWPQD07gHUnxhDI89bBoxMoBLObX/Fig/NvvV58np
	HMhSveLjXpA64YE/NnBnSZQdN1NTl+NbcVmEMeJLl6vQrZzxgEtp2YGlsmc9WoRmUu0bh6rk+q0
	1y2Lj6YFZ9lxT22qf6wVFRlyRR+nv+Bxhshp7bzx1Z0TVYfcFm29Y3g8babU/Xrij18zlOZ0dG2
	65Pv+WpbPO/ZI9qF9WC/84RQ/uc3T+sq/8sqE2lTeAMPzraWHP01nx5D4wGITqW+GTz4wRIhmFe
	i6uDT2srwbyXsFWpij7FvqGe+2EAA/gI3Ou9ilHsU4hO6r1JtdtD1VtMXzNFev8Zkcb9krHH1mD
	tx8MO5rJvhqamB7UWf7+j6NZe9lDd3/rk2JxuE8DnfD+ntj+GTD5nZ0nm+Mvz2z+Z/z2mhuUA/O
	B87W3PeWu6C+v9AYs5KGo8STrg0ZTtuDCqccBpVcnGEOLRHyv7RuTvsh2+msEbcBpJQ+jwdYZta
	d/gBgDvT6ucp6682fnfxXzygTk+hw4uGCjyp1Psit3Gom93/qXD+GVbwBsjzqSKj7DSehkbL38F
	jFfdFTRDoC8OdMC+q6WR+V6Z74YixdNhmIvwHpxyQ62PL
X-Received: by 2002:a17:903:4b07:b0:2ed:379:1592 with SMTP id d9443c01a7336-2f03f14473cmr23954385ad.26.1795169065871;
        Fri, 20 Nov 2026 02:04:25 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm11797365ad.18.2026.11.20.02.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:25 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: atmel: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:04:06 +0700
Message-ID: <20261120100408.8053-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_020426_978521_A6886A80 
X-CRM114-Status: UNSURE (   7.24  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series marks the interrupt mask and status registers as volatile 
in the PDMC and SPDIFTX drivers to ensure they are read from hardware.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel: mchp-pdmc: Mark IMR as volatile
  ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile

 sound/soc/atmel/mchp-pdmc.c    |  1 +
 sound/soc/atmel/mchp-spdiftx.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.43.0


