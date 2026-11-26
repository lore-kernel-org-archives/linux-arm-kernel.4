Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D48606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 21:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i3RG6K7D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=vLUrJexb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pro3sUEp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=; b=i3RG6K7DOgjXXC
	1QmfeDyYEKFdIPIcrZ7yZXBTmjH+arJRvsVtzBYMscwwENwHs27h4r7X6k2DviuuUVLhMZ0JHdA6K
	DkqKMHGteUG2FUlf+Iw0NInl+zWrDnR6XJJ0l5SZhLnAE4lTzwR44ruOl9AzA1o768Vr2MweiALDA
	iE8gBmszLC96XqZJPXY3LrKCS2jrLVnxFVg4oHYll4FjEkMSSBVqYc6hXv6/VabdL2xqVykldtpm+
	ua1CWeArr6GRUar5hzTnx1HidW5XjT7ExwdM9WBV1AgNpBHVeaYsTr5OTwVG536K6NolSLMlr1SHH
	gb6GKBBMbSdadt7v9q1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhHG-0000000Ea6I-0Or9;
	Thu, 26 Nov 2026 21:45:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhH8-0000000Ea2o-1s6p
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 21:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=; b=vLUrJexby5FvtXY09s/LwQy4LX
	e0QoBlouDtZKcI6XbokKxMzUJK4HVJ4R+ZtxD1IDpttEzUW5yWKVWRqaP9HpLuyNg9TC0U7vBNQm7
	43CX6ANGCod52rId4Lfn9CgCcc7KUekbhfYojUjvloYL6bq0/6O7QdoVvENzyRkywJLwzhyYQ6WSp
	KLV5bTh3vOJN/BuoihV6kIg5BcXsKYVk+EHl0VjbmdkPwTZSPhTviWoDuZT5cA2zb7vBObsjxzhb5
	3jQ+ijFu3+x9rVl5iWSXPcAhIZzJaTRcIAzo1Fg9f0tkGZv3wxDGwHqpYCS3YQZDpQnrfScGpcXuM
	nFnBDOiA==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGv-0000000CvTF-2x3x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:45:05 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso4308698f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729492; x=1796334292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=;
        b=Pro3sUEpSayfVnTzkFwJKgYoQukECwgKmwE4YXZYHc/ecIrisGEwECYynOlzLyMjPh
         bo0n6hYUoEHosVTEUnOyeM9NcE4sWrSD7CFvYXheIPh3PsVN3q/uSVc50ccwTww12w5q
         yql8/sYQ1rJk8KGK03dDav35liDLiz32gcIt83P/432U3cc/+JIaYCJ3zwHbXHcisihb
         fWX3ccsneaxoV11h3nEvpftSf0i2mq1Xnv/Pbrla/xwiEJhfvN1WT6luBPr5l1j5WMin
         vyU1gUSKtEgVnfdJWPO93Zfi8+h0BuLsLo8q5HEixaR6hadoRKhnYzvcu96d2bOo2UE9
         G2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729492; x=1796334292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLBiJ3Y98YIzDtQw/fAmF2XOq735TmDEhRo28kTS8fQ=;
        b=KDqD26TQ6Ay8JF4Mnwa6W3yAL+A83oDTiOl39JtNcuJ43d4uzfx6YMg7CR7o9CbBY9
         VJpXeKP64+30jFgjOHu9JFGQ7+dtu8OZt6DWfheCgOFbOumt+DjyThyQJ+iZWkC4zXj7
         Ws4OW4yycpiSn8qyjblS4SMMG1gMlPFcLne7qBjUs54uiLRqkQrm2d5Bs0f8cP1oI+Fd
         OC78Q3LIJQft5d+wurRfRwAbpAFzlbK7+pnngxvdYIVg2eA8V+pzMChZ89ASvNL6ro5n
         0eXz2EQEbanXhq9rhXncBLap3TIwR8BKTknhke09ygGCrU9P1lm/lPUJ+/W0yqKTEuRi
         DckA==
X-Forwarded-Encrypted: i=1; AL+hErEtrU6ljenQFaHTaG/q6gUvBdN1U8KqYY1uhQLpsodJC7I0ELSSI2/FUmQydVcyjnlxNbFauaYenKOX8A96ifly@lists.infradead.org
X-Gm-Message-State: APuU4Z+699ypJhO+SyDSN/b9jwn2rcui5mlM43xwdMB3ZeGrh0e3bLFu
	gdGq2CgP/UaaRz6gH614YSnAH56V1v2bBQXeX3qm0CwEP/gaF3ETCDtX
X-Gm-Gg: AZFdTZf5GP4nN8teNPOiSXNJlvBOlrlL3blhjmCJ5Soc+HURxvsQ+Sj74Q8tDmHZEm4
	FiRigbtIXLkcoG7Dxw2U+d+a/H8jBtbSBhnR3UNfmBuOiubAUUmQn8VohSuesnw+cIaPRTJV75l
	HrmsnbE5+ItGZd3cpD7adSxlvPg4lMStSyo13ZmN5PSlya7YV/LlbRLzSuOS60CyqYBGe7l6w3r
	CKd7fT8DILOS9U/7iTEMtKS3nmzqAQEs72GABsdqawL6S5PDbBTfF8DItNCeh7NKGtw9TzBcsx8
	0qkIUUPSlpSLuLYs76RvxjdvV6p9zgrDiPRSLCVT0wmsyp3WUscXjhceS4K1spEDqZh9bot9ykc
	7L9k1wsl0CMt5t7ehlmnf2j+Ssd6eJdtVHZb/8EssEDVdoHVedx5xS4TcAXhnNK/0eYbdFacblq
	1VkoynaIqmoDzWFdLtaAofsMgUg28RPUB3ll1+su2U1sYiGc27xFurl5z7zbYbRUz4eKO9mdl4C
	xn3tBa+GE20DsRhoPspuKlCTaqbN9OOAr68ElM521v+pNA5gJmsGpeW7XDW7N6/hr7ih4Ju/y1+
	f9qLSt6jtdxCMJPX0cm2NovkCLSdmrXBdX+1scXsNvvnTsIZOv4+8ooqECiuP25ftgOP8/608/C
	keC3NlJeqYXU1cEA+XlhYmu57MUccSPxhieDLTWROZCOYoSaYZ6cMjRlGJhJPK2kbkEpY49NexK
	nPoRGlRG0JMPd5RX3CYlWQFTWqbsILpzeqeYXOXuGR/MhGjy3gJ3gx6FBWmC3qw9P8KeR9hDu7s
	GsTOdc/lb72Fkrn+5qwnVJH/q9tV5T262wvhu5+4AtinX4vDzmAzcc7jBjQYGvm
X-Received: by 2002:a05:6000:2c05:b0:4a7:ed95:7c9f with SMTP id ffacd0b85a97d-4abb19c16a4mr44426780f8f.22.1795729491930;
        Thu, 26 Nov 2026 13:44:51 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] drm/sun4i: Add compatible for H616 display engine
Date: Thu, 26 Nov 2026 22:44:31 +0100
Message-ID: <20261126214433.3562326-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214459_078959_F0A4F4A1 
X-CRM114-Status: GOOD (  13.09  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable H616 display engine pipeline by adding respective compatible.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 248be5ff4f36..18cd9a993348 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -442,6 +442,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun20i-d1-display-engine" },
 	{ .compatible = "allwinner,sun50i-a64-display-engine" },
 	{ .compatible = "allwinner,sun50i-h6-display-engine" },
+	{ .compatible = "allwinner,sun50i-h616-display-engine" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
-- 
2.43.0


