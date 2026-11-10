Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CFF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AqxFdIpy;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e0evrTXU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r0F/G1/cCd6YtCyJox781fOcwZWIec41wc+ColCaqik=; b=AqxFdIpy+UQi75
	n/PI+s77Uq7zJuJ0YnibagzBOhPWI/qTgBt19TFdYQZ8z2DBMBzFWx1cDsAvfMka/MNHkBfQu9kzs
	KXCsIp8wPqi4eaVH2EAV0yVgbYU6YgS6DNbkk5pSxpdHP9EuHbcL2vtaFiRXE28VZsKtJFIZ8no4a
	g4vECT83YL9mUIPRtiM8czxyQUvWCfs2Cp5F04a3S0qJieeciuoC1fv8D2ANhYS0mzzcaiW7xTQDc
	m9LTHqWTSv92NIPI0JLdJU1FxsOI4meJhR7ZKBQRcfMpsGJPHv4S8YzONAXu1RLFAEudRLXgGPzi5
	Ef4+OcQGzE4sNlrghkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQt1v-000000051zt-3bUb;
	Tue, 10 Nov 2026 21:05:23 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQt1t-000000051zW-0LIO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:05:22 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-716ea2598eeso1450831eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794344719; x=1794949519; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0F/G1/cCd6YtCyJox781fOcwZWIec41wc+ColCaqik=;
        b=e0evrTXUK7vLs3biKO7Azkou5MgKFpm8DDw7aUzUd025viNwAIHzN8V7kbqZkBa/Qe
         N46Gdpm3e9XWcGetdtlGHWhMWCodTdJ+yr5vdIWIYzARCEimmJLiKZgu1g2QJWyEMwqh
         NJ34sVT4smhXyx8FzD6+EUo562UwW6eKaUdX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344719; x=1794949519;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0F/G1/cCd6YtCyJox781fOcwZWIec41wc+ColCaqik=;
        b=nhb4xv+DaYfYh0llX/H3+Ugd5Q5LbSbRKLBjkrraJtKQn3aV3V8pCkI7cTOXSXAgpg
         kHGCw3hVOFC6keVehviGX56M+C4SXuVShxwCDDQ8XKCavLwq8eJU8S6oyVD+PhhHpV5o
         O5y0+XzxwIDKo7Zdkz589URcC0LzO+Z94rjGelchznqp1SrFFXz+Je3YXX9PMmLGt15d
         emhTvif7diMn8lZKUaycYX8bbcH30CHWKVNb7oEbBHlqez2wjTun3Em3FFNL3hR+qDtz
         H/SZHcqvxG6ZdUEx1Eapj7Ut9nrRe3dA6et5pXJYp9yaPiglq6PvZkbSwcNXofhVFx3x
         1Psg==
X-Forwarded-Encrypted: i=1; AL+hErF7rlvFaUUF0wDde2pFZ5acocihpC148VGv5pIlH9bJr2w9+jUVqvlS2wHlj7vYA/JxNud+0ouS2sCmwnVNrIfw@lists.infradead.org
X-Gm-Message-State: APuU4Z9JA+vWXqkbclU5u9SdcaqDEVWA41S8jDCkNOkS/cuay7rA5nNM
	YnLML+3ceVVgeGVU9CSE7yT12QY44zm3lWM/OXKp3cqpFiReDSD+0kA8AEQhrni61Q==
X-Gm-Gg: AYBFou0HWYOQecXd0c45ra2/BSbySyocyc86oZ2JI+XVNoHfSlkK3mfv8hpijiJ1zkg
	lJgnVoXsGVUXx7yXkltxmsL14/H9mjJE97WDomnUBgsfsCfBXBU0+UeyQ7ryuB4lys1c7lb+77v
	1E85r2HbYma3XTs/rqoZSP5pnpbmD3quS10L+p3w4qx/Ui2EFZBDoWiWvXyZJNHE5YvTyyJRuIF
	wZxAG+d+kfRbAcmGchUG3IdhF8EANk8Jg7IVniFqTxWXElRvTB+MfIk3bi7eMncIlwFVEn9204Z
	7ro3enXQxhyJqahFA7H6jmzDa6IEE3H1y/Xz+yTqRG8jOCXf+7EujEdoTZpSz0mGBv6yHX0qRJI
	1XWgTVL+LC8e7+eHJMwj9/DAXwjkLKs86uOubfLmCw55y0lVI84rTW7h750urmQiRW1pr9rGzmK
	HEh955cihUstT5vn5eiE7ahSELs5GPeZ9K3JOwWU2hzelyHMdc/Oe6iEGZisLcfTap0sPtPGxCl
	S24Te1NEPTYYIVWJ8BfxVydYViEh2YvgADBSW/PnV6db2TicfYpG6i1sMH8JNFBPS4ZaQJcbMXU
	zwbfSxV39CKfGdqYtQyMrJi+6r07h7gA0BTBAUN28oT1TjX6iq/3aj9wgjTqVrc66sy55eeqYJW
	GFVBiuicT4uqLeMKAgmuqaxhunBeu+xqQG1FLeA==
X-Received: by 2002:a05:6820:c44a:20b0:6d9:979e:22ad with SMTP id 006d021491bc7-71917934e44mr119108eaf.54.1794344719257;
        Tue, 10 Nov 2026 13:05:19 -0800 (PST)
Received: from rrangel.c.googlers.com.com (57.128.170.34.bc.googleusercontent.com. [34.170.128.57])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb62443sm2856553a34.6.2026.11.10.13.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:05:17 -0800 (PST)
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
Subject: Re: [PATCH v11 7/8] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Tue, 10 Nov 2026 14:05:14 -0700
Message-ID: <20261110210514.1091741-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261109-submit-serial-8250-dma-cancel-v1-v11-7-6364edca63d6@gmail.com>
References: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com> <20261109-submit-serial-8250-dma-cancel-v1-v11-7-6364edca63d6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_130521_157393_D6DE421B 
X-CRM114-Status: GOOD (  11.20  )
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

On Mon, Nov 09, 2026 at 09:00:22PM -0700, James Hilliard wrote:
> After one second of unsuccessful pause retries, stop the transfer with
> dmaengine_terminate_sync() outside the port lock. An indefinite wait could
> otherwise leave a request/response peer waiting for data that is stuck in
> a partial DMA buffer. Report that recovery discards the pending payload:
> without a stable residue it cannot safely be copied. Keep rx_running,
> rx_pause_pending and rx_terminating set until termination has stopped DMA
> and drained its callbacks. Then restore receive handling and allow another
> DMA descriptor, without latching a permanent PIO fallback for a pause
> timeout. This trades the stalled transfer's data for continued reception.

Reviewed-by: Raul E Rangel <rrangel@chromium.org>

