Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA485606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 06:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KAA7j5IH;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rn0lInkE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B4or4yeY8OHZRKSj5APXjf36hThUdnZ1Yx/De8GBlX4=; b=KAA7j5IHU7mUN9J1BPZ5WzzJ+C
	gRiHrp8CbBHz2jTk+B5V2uMiWIJAeTXHrgJVAWiYIFdy0AoYfPYMXUwE1xzaB0kq2F21E1jcaeqAH
	0HcGD3QThGaGj60fEuESNwTJdN3dtp3zEUOboM/OCInU3draLbcMWbPfXQhrsE7ZafRTAaTIAInGh
	301IlPqFl4/6H7lCRtp/j+vsQnOfgzfDFk+UJuiwaXYNZeluMrO9UraKtoSD4pTfw0uTkAV5kmbkq
	g9oYmDPTmZRSRSpNmGiNjCSx68zSpfTNi/bSrxYswHZsJD/2Sa1PCgwVWMucAX+b7EZcRrSVV/d/4
	Yrk8QwEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO0S-00000002PZm-33HW;
	Mon, 23 Nov 2026 06:58:37 +0000
Received: from mail-dy1-x1347.google.com ([2607:f8b0:4864:20::1347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO09-00000002PVv-2aMp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 06:58:23 +0000
Received: by mail-dy1-x1347.google.com with SMTP id 5a478bee46e88-386b8624cf7so207731eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 22:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795417086; x=1796021886; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4or4yeY8OHZRKSj5APXjf36hThUdnZ1Yx/De8GBlX4=;
        b=Rn0lInkE5FpEBDIWbMoT7Smg6ChrklLmh73X58fsa+Jz86hBIklxuGqY23lEly+Srn
         63/duwJiQXYDeynSRq6AtUZJhM1D0NbA6yYA4C1liWvmuPQNAtmNbxINyQ1C3tBslfuH
         7TiXqpV6UpV3IGBs8WGp23zHl8d3OuxSLNMgzxW1BGgpb6POISL2TRKrcoZHiLsIGtgo
         jq7ZhUE9xcqlDP8V3fhZZaKQ8AhV2f/M9NT5+BUmpTm83wvMv6IQFG6p3F4lBMl9Es0/
         uUekihARVAFVZQ1sDvzsUo3OAnRPIE8bzES0E2hdDJ5qt0XH5STLUuUzYCGM+bRaHafw
         YCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417086; x=1796021886;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4or4yeY8OHZRKSj5APXjf36hThUdnZ1Yx/De8GBlX4=;
        b=KprPrYNLiYLDoFreRctC04nAvdUF1MIfg081rUX0oKeCMcLNMf5HESxpe1gJaxOdN7
         026g6QjipmLH2GVMErQCQvO3U8hDxGZAMfzN14Sg+OMO5dTlYll0JNJE62ikHbw5g/ry
         WGqpqs/DW8YRxpB073zLQRgmDyCyrtXxIdF7wNmKqvw42lVKJq5v7FELJQI/WfOmJjuk
         g2xpbu82VIQnvjnz6/66YyZAQNK1cQcHQKaC+xuNTP+8Rg2FgZLnILrIy6e4lM+jL1bN
         cs5Y2USYv4AaYUvmsEoZf9uKPH8ppr8AHD0N/ga6Tb5/1m2cmNa67PXwLBUgW1195kTE
         Tohg==
X-Forwarded-Encrypted: i=1; AL+hErFd/BG2buYcuoYy3RQFtix2OvJbCf6UycidPidBBR5xozpK6C10r7ntIXG6QjLAs5B0N+iW4BIjMN3z0Efcdb7Y@lists.infradead.org
X-Gm-Message-State: APuU4Z/dY8NQuINbu2CnlfGf0lsHRl98ko1umI/VUHNb/wk7Cgop+Aiv
	Ie9B3YLvvn29Xh0LmPf/yWQbgW0lAAb0vYl7tWv2MAZ42osBOXz2gGLbP6OaIxQZgERH5hSsJEI
	xHd/fxFrU0w==
X-Received: from dybmw18.prod.google.com ([2002:a05:7300:cd92:b0:380:c63f:6b75])
 (user=yidilin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:f68e:b0:383:d3d1:f31e
 with SMTP id 5a478bee46e88-3856e94760dmr10863514eec.6.1795417085859; Sun, 22
 Nov 2026 22:58:05 -0800 (PST)
Date: Mon, 23 Nov 2026 14:58:01 +0800
In-Reply-To: <0964123eb95cd4a6516df05003f59f3cdb260d00.camel@mediatek.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <0964123eb95cd4a6516df05003f59f3cdb260d00.camel@mediatek.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123065802.322838-1-yidilin@google.com>
Subject: Re: [PATCH] drm/mediatek: dp: Wait for the complete AUX reply before
 reading it
From: Yidi Lin <yidilin@google.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fei Shao <fshao@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_225810_144431_BD261A7D 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi CK,

Please don't apply this patch for now. It breaks AUX reads with one eDP
panel (CSOT MNB601LS1-6, EDID ID CSW 0x1106) on an MT8189 Chromebook:
the wait for AUX_RX_AUX_RECV_COMPLETE times out with the AUX RX PHY not
idle ("AUX Rx Aux hang, need SW reset"), so the EDID can't be read and
the panel falls back to conservative timings. The current code doesn't
hit this because it reads the RX FIFO as soon as the write pointer
moves.

I'm looking into what is different about this panel's replies, and will
either send a v2 that handles it or drop the patch.

Sorry for the noise, and thanks for the review.

Yidi

