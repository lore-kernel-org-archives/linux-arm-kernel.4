Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CDA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gh3uYYFO;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PMAJsqEd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wtusPwl7oTxkglScGF7WcIoLENdcCkcXrxudV6XyW/M=; b=Gh3uYYFOAWWJEN
	IhkQu0s0sgRkWOsEKvwb73LhceD0+atOKHWvxXCsPcdX2qPpmKDQQhNF1tYayFK09NuYkl0VoxHpp
	j9HCmkCfuFldx+uK2G1NT6viYBILbg7oTRofl2iexhAyZb0j8hVqYOyUmbwLdB0VM7nLFUU0fhIOG
	QTZ9dGiS/4aaav2CxZcsxRjtbtgM4XI3o9mjcFUR1HWO0q2l+SjbbSC4XSARPBvo+h5zrhhW/uoOx
	UZHDDSQ2a0zJoYQZ/OVslbCUicF/nIqODqQZ4NJw0wqZF7P5lpLohwIVLfvjefUyclkuxSvf3oG4p
	F9rcIhB36o+RcloSSVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2Ag-000000001zd-1t2e;
	Fri, 27 Nov 2026 20:03:50 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2A0-000000001mg-2sq6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 20:03:10 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c5198302d38so674981666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 12:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795809787; x=1796414587; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wtusPwl7oTxkglScGF7WcIoLENdcCkcXrxudV6XyW/M=;
        b=PMAJsqEdYAKIeXQsBIb2RILIAkX8vS0Zh0WoZ0C1zERaNqauCGDQliXH6YqN+Z8gtI
         W0UCQHQYUmfpEtS6ZVHuSdc5xmFUufdtmYpv83LI6IThDc2oJPT8Kb2Ps0yMPAFB/WwN
         2zNOtTbP7Tn59lnAQCkYf2wFGvVD+Y3Kd4jlz/hclnPo2Z83yIfEGCOkWOEm5XJpVeTL
         vOLDN7Le2zJ0as/pV1Iwk8VDNTN2IbB8R6NoRFDfQ3dEMOfEjuSP+uUmA0BJ87POzp31
         /D2r/scTT0Px/tAkI/zZRZS7JreJpHrN0URSJsEJC4CM9oOO48HhS1tamGLaJvOkozNz
         +1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809787; x=1796414587;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtusPwl7oTxkglScGF7WcIoLENdcCkcXrxudV6XyW/M=;
        b=Ng4Lgxiy+kx+FAqGrYeGYtT/sSpIsTcFg/oJ4yVUsPqPykWrqv6KQ/gH/tlO8YoPEX
         f0oxDaW0URGC75P7nClGV6f18BBsETadaYb7dHRz3H/D/Ikn2bpfROW3d1FVGF22oIha
         Qvc0B+jkoPW3kPTAZu8fu5hbEZOh3lga3vyM5Tm9oaZFe2YWbvSqM9GSZ9mjsFK/5QLN
         edm3vSKFxYMJ/H5ONIBbwjFC0zZj4zlUkuuyuACrRjTl85208f/lelucB4IxC4bo/Bxf
         bqhHtJ9xn6ZKjXqIpJXJZXW6RghxEr6kKCVCOFsN91zU+4o48+/uW8W76zHVxi6qnvQ1
         e9Rg==
X-Forwarded-Encrypted: i=1; AL+hErG9QugXJvCa2XcFZLsFZLarMsDLUUObRVtdCubqE/K++2l6azURSS8DLdOHAggV5mrTPFgvrnvqg3NjmjqnJwGT@lists.infradead.org
X-Gm-Message-State: APuU4Z8FAq0+eKlqjyhGIhfGJzz6vtYf08Ju597VNkYEJEZWWlRTbeo+
	qPf07R9QRyYhfBDwacFJk/Zai9hyo3QjIWC2evj6P8s/F+kJ4IQwcN34/R5YF/xpfHA=
X-Gm-Gg: AZFdTZfusD2VBvfr4QrobG4dOKcZU3eSxgbWIz1fhtGZ4WdM7g9enT7mrJGioqaMtuQ
	9JvIT59mwrDoTROkGCFw/d6rd7+N5LMkN12ji92O6N4QQEQHDYmSsrXmsXad8yWvKfMRecTGxFG
	isfrwmCR1T4enXIvZNyGV11qfclMJeRlAexahgpdmyr3cuxz6c3YBDL2cQA7l7vJnHRVliHJLaj
	/FmvBBK/+9yigoYtCGDVIEeIvw4Tva4VqbXEHoDTSKHzOwylh2YHCLkxE4XoYTY02Oz+09pG+sr
	BPekgGoPErkk7quCrtEjXpQ/XJ1gJHCet04hOMKw/se7BeXnxzFTQgcIUQufDitfOq0eRLa82tL
	SxWmZbHvpP2tV0b8nZ04T9tN2+vVy7F5OslhFPR7SKffm36OqveimSwULoLHz7Sg1Z+tkmJM2x1
	qQhBHdANC+1NlzFDLcAfOWUq4zSYOFhImG+odR0qipc/JX2IR4Ko3qtPgw9QMuQHtTWGgsH9vLU
	9VJ7fEDYXenu14JmAG6DkriAmTLymJ5X+U2KDOU1znBmkdPb7chQMtcKoZRkMjVmo/yVkDeW0ob
	g99fNkKAb/0l0QTrvDknGZNU2PK0ZbwpUikknFGukrBw+nYn
X-Received: by 2002:a17:906:5908:b0:c3f:d8f2:f08e with SMTP id a640c23a62f3a-c513aad1aa7mr1591096666b.44.1795809786817;
        Fri, 27 Nov 2026 12:03:06 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae661b3sm897861366b.16.2026.11.27.12.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:03:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/6] clk: Add dev_clk_get_from_provider()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <7155949aea78042fd399da5ad23a72765b2b6cc7.1795094688.git.geert+renesas@glider.be>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <7155949aea78042fd399da5ad23a72765b2b6cc7.1795094688.git.geert+renesas@glider.be>
Date: Fri, 27 Nov 2026 21:02:59 +0100
Message-Id: <179580977969.3028968.47907747276860033.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=576; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=w+BoHiPo+P6YGPZSkRwTWt/kGI08hfYqlVrPoLWDzrs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcD781zBdazCsg9lL/zber23mznz9vt33xqqNRSyql5
 9/lP4XqHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjIejtGhnPrDj/t/PYpMF4p
 5/BazfN3D21QT/A6eNT9yBfJZ1dZop8wMpzYzS/A8uDOTLmdR+uChb9oSs6TL/Rb7JC9947joo3
 LLnMBAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120308_745328_20104A3E 
X-CRM114-Status: GOOD (  10.18  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 14:40:35 +0100, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Clocks obtained through of_clk_get_from_provider() show up as
> "deviceless" in the consumer column of the clk_summary file in debugfs.
> Add a new variant dev_clk_get_from_provider() that also takes a consumer
> device, so callers can provide it, and consumer's name will be shown in
> the clk_summary output.
> 
> Reimplement of_clk_get_from_provider() on top of
> dev_clk_get_from_provider().
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


