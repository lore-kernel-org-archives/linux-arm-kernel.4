Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C35606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RWfEQbcr;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HTAE75dg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=; b=RWfEQbcrlpik3S
	L7KlZQ/u1RQ/XovWCZEdkfLVCub4SiNiujXRCJEwDzKr+WAil4ey4HOt4lUdQ7f5+CEsamN/pcyu1
	A7OYJcnrklWaPZkrpVFJi2khv5SAR0uuVZJvoIYTS8m1QdxrrHmmS3kFIYwdccbjZrgHvXQHQH1A7
	XCjd1GLjmRHb+5G3Hxh8SvOs746tjx6+9uhIC5YBZ9xv1UOjI+Rf1xftBhCrBG1RoDHDL49z2SAWU
	Sc9LDBTKG8eFhSDCQJyFeP8XUt2Du2N0TQHOAqptL4AFLATUEK7tnaY9dcV8jHpMyoxA7fBeT17nI
	5jsn80Zm81yAzQwumFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS7x-00000001BMb-2cj2;
	Mon, 09 Nov 2026 16:21:49 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS7r-00000001BLO-14VW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:21:46 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-4a85c656c58so727122fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 08:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794241301; x=1794846101; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=HTAE75dgkRuerfSM4wK8s5TeZUZtbxSj3qtePptBV0lMRHAOyOw6cqj2c0G5GBy6aK
         JvsboiPCoWd7FyNS9aXbZTaeTK2oCvAPmBAXBSLbblpVZC/DsGTjHQ7grbjJF/KWVIpm
         WtzM+7AByox8n1MI/pd8p3XCxd7ECq7aUizic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241301; x=1794846101;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=Fj/PkR52dBEp95K6/AJfPSZOndBlSAWAqzLt6vWUjmcI/df1WEwU1L1v1ChhkuQJbm
         EbDDF6dtnZV0ZBXJ4l4GeCy5Hn8LohMXzKjs9/fIolhby5/2zv6WpwaIg+Qls53UmIKg
         qoQdyW1AbNmPm7uN/xY7wBm93jl9+lIOoOShzwYbdMCJX5Rem+gyhr5Y96Kdrqqud5TC
         ClfViA+EymLIi+Td1D2vQ6ZsNPA2yvm5NF4q05TU7nOM9w+Cu1jYTAwGwhJc6YQVjfw3
         nBcjeKOfozfECKpJklzU4f0Ok/H8IMLOo2s91OyOm4asM/S412leN8OY2VdbRqBlSKRP
         7eAA==
X-Forwarded-Encrypted: i=1; AL+hErF3F8hvz1nDGno/7VF8a8b4A4P3u7K6nfRZH/vFf7RbcGpZQJoKcpjbD9lgZ6Qp/ePjb6tlq534OG+Zj9kNLiT7@lists.infradead.org
X-Gm-Message-State: APuU4Z87Ua3zM1KfL28V3Bv1E/oG86fk/rLfEM22jCYPNgBxgP1PJg0V
	i49Dy+Xbi21RvsQ0Ppo2PucFGCkwC3Yndulj05LyYQFRRHokxh7LbpgUX6B4cp3hkw==
X-Gm-Gg: AYBFou08jibHXKKGAujsqWTbc4pRzYOd9CDV0lTRSKqomUDPNytiMz7i9GBiRv7Pazj
	UWhHupwg1euaWRkxqnzvIiUuyIhcZISBgfxPVyZ14OXuwUJWp7F6OKtGp3xdl4twrrBWjbDFPED
	eLlVYx5htBP+v2P0bgPMLXkLYDCSptasu7/F+t6qKRF4sXQWG3NvZkd/p1S2AeR8zg57B7WWyKJ
	h2r7YVqMom9QAPzJgbBvgkuyjtgLyIVUxJoTFIafuxBhAsp7Y2xZt+Nllk0dYUbPbRdEHQ8aY+P
	23cU4zE1FLyhnRNUKdgQxvKA7pjAjzCv5nRV0a+cgIEyKaFYn1BZA8G3tf6rcWirX82uw+jh1qT
	axDwyWZBJ3vlAdcLGrZ5EUVWTaMs6d8/zSdbsmVklT43frs7ZMbz0grR7BoJbL8ahB/IMfi6o9p
	ul1nDcikAUJF8ssSHSQDvG71knTFtteDFiEAOBic6+ucP79bIeJuhcVlCQqsUe40wpxs5lXiX6j
	eZMvsWIYFCjZ7oD19yd9caZJDT3dA1EeKil9rS5aN+9yS0FrzaOpSEtinzqd6FKLyl5SbJRkfiS
	g7tPUXaYlcsY+ie9+u/7M3mvBF6yKXOoKpwGZDenph5yVMR0Ijcauo6CDeSkEIapP6M0A/nz6wc
	UnfTjNianhSLaVI6tAW/rDhKvpkBnFUCzq4HY
X-Received: by 2002:a05:6871:3321:b0:4ad:2386:45ca with SMTP id 586e51a60fabf-4adecba6a5bmr2379052fac.55.1794241300604;
        Mon, 09 Nov 2026 08:21:40 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade694062csm5510676fac.8.2026.11.09.08.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:21:39 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Raul E Rangel <rrangel@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v10 8/8] serial: 8250: retain DMA resources when termination fails
Date: Mon,  9 Nov 2026 09:21:35 -0700
Message-ID: <20261109162135.906262-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261108-submit-serial-8250-dma-cancel-v1-v10-8-e6227ddb95b1@gmail.com>
References: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com> <20261108-submit-serial-8250-dma-cancel-v1-v10-8-e6227ddb95b1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_082144_696072_E69F6017 
X-CRM114-Status: UNSURE (   6.38  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Raul E Rangel <rrangel@chromium.org>

