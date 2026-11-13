Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150C6606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iDKT3zTO;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=H3XB6BDq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/bOZaKuWDgzdIBtnYxUiBUDvqzx9ophFtd7ONrx4yPs=; b=iDKT3zTOfi7kjST4hHQbIH5XQM
	BZ+FO1wtKM03gLKnxCZHApY0MeTP/SCLliH/orLSiWELZ9Ar/eCO/L1gA0zU8kPF6xp3BkQSPEJeq
	3lMovIVhcNd5djY97XiE24BV23AlLYL0i8+6fpLXgqF4AaFYc5IBpmZrJw8bX2Ys/sTP6/hCp1Kj2
	JWw03v9Zkp2KPC4UO0yE7rv74o8cueFqoxqAdF6BrOlgz23WTDvckgtgV9CzVneD5OmyMHDZMRwQY
	SHIvO3VTGP7A74G6NPIpnx+NPgg/KDmLn2R/57o+3v2Fiu0X5fhHzW4YTO3Ou7pfsUd2kkexKnljy
	It3PrB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsvA-0000000DK4l-3QZk;
	Fri, 13 Nov 2026 15:10:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsv7-0000000DK1F-1FAe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:10:31 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-490d59c3edaso635984f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794582627; x=1795187427; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bOZaKuWDgzdIBtnYxUiBUDvqzx9ophFtd7ONrx4yPs=;
        b=H3XB6BDqTwfszXbuq8xWaUMUbTd1bfdEwcKPm0i0eSiL5xl70C1Qvo0N1S9ltV3r5W
         PhyVG2gFJSmGR5C79SDt+DE6ssJyDLKazhzciuTlQAuPxcnAtTFk7efoeYC6Hp2O4AHT
         5KtygBuSY3/t1ZmHNuTimmzf5DjBu8Y9IU+0UIjJ7gNP7ec2+94tgkxlePjSmk4c4L8T
         iOnhycgDlyTE0EJHceZXwnYH2jcPTRDfevBL6S0ckdUGaK8zhjayyLv4LoN7PtQnGI9g
         g5ZusTKFuM1Bj+bUnUE0eFXdnkwwEbchEqMwM5JmfFi3hgrtip8sSL5KSfw4fqNxmzKD
         xu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582627; x=1795187427;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bOZaKuWDgzdIBtnYxUiBUDvqzx9ophFtd7ONrx4yPs=;
        b=eu9Y0aaa1G5VdzOG1vkajB/47zDELhyDqAesXQ3EdlcAyWzpZxg5q7tiJ58dIm2f4U
         sgYMf1DHGOCyKTNftlro48aCWfCFmd+Cuadhoo6/svGtaivLZYpp/YcUoC06fJJywZES
         DM8eRICNgL/NPOpN3MncOroRwDgdqUiZXP+5B2cvLis95ywgeMqDd3xnwESVg1parmuM
         ww6eoCsz1TOLmgxqDlb2h7tiHs4YlYkg1yOUbzA/qHDRn0WoPcCYe97tdve+obCCP3i+
         ZnJycU0zZN0YH6r4C1mz/1gkZ49emmTKzJq1gEyQ5bmB2TQ1MaWhUlhasJG/2KnxNEsP
         cnMA==
X-Forwarded-Encrypted: i=1; AL+hErFTtjmjTtOMxjBvnEdHUN2KCMLEinMIpiQv6G40YbXgioLZykgWLjhjUktW7AHq/0OAh59ZbDCszmj95uQNpGbw@lists.infradead.org
X-Gm-Message-State: APuU4Z9a8ReAdYFQvkerFWen9uPYev+tYrqhU4sQhx8P1vXqcERNewaJ
	2jEfDUJavsO85oNTecjl2utSX0Xm626ouIEk3QU9IZK4ghxgF7x1B5nAQSWn/VHdY7c=
X-Gm-Gg: AYBFou0Y9qKQHJ/8gbNpnh+Em7ukaYNNSNDNPhQ9zhGIz3jNAFOlUWio7c3DCeAb0Oq
	fu70Ae3dVcfysuZSwAy8Xj6zBToachVrc32VDJjifW9yNtlX14Kp8Sq98X2icHlojwgUxG14pFD
	g+nv5Q0fYoYpTAYDYZ3DmTV/6uen/Cvmokpnfp5GGQoHwb0pagWBnSbfzIuN9+lybEKWyMgyar9
	TpOIivwZfVcwZeL2M0ybP/7SkYh8d19rpTguMw/xJ82z35GAu8b2ncpOnr1Qoka+sNj2IecLiTh
	0BR+A+k1mzbTr8Jtqn0LqFLNPrAE7wou4Gk3LJvkMaL8Urg7UwIQ8qmxDs28SaYTSFZ4EeijxAf
	RKhiEctHnaCTnOOH8DXWJhPNg359itdQbECEWcpwsgLpTlyiwMUMPwcXlzk8Bwai5uiLp8CGuFa
	3FYZt1HYL2iVQ+4lwud5bJw+NWsoNxI3nBwfs3FwAVlJ3FoCCCdy3oqJ3qJdAQEFGKUjFmMbUPi
	rEpNHuQRQACjlcSmXe91Z9tcLFL4m5V8F1vaqZV6PxSJa2QLbANS/RQMADykBTx1SvwTTR1X8Qw
	yJZeT/3aXl0sebKC9DDUkRh97b8xC0HDIXTsDPHX8/iA5+Ch
X-Received: by 2002:a05:6000:27d3:b0:492:aff5:da60 with SMTP id ffacd0b85a97d-49b01cf341fmr9163986f8f.13.1794582627273;
        Fri, 13 Nov 2026 07:10:27 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm5879282f8f.56.2026.11.13.07.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:10:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Valerio
 Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: gx-formatter: change stream lock
 from mutex to spinlock
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
Date: Fri, 13 Nov 2026 16:10:26 +0100
Message-ID: <1jzevczs0t.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_071029_689096_BD92698C 
X-CRM114-Status: UNSURE (   8.08  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On mer. 11 nov. 2026 at 11:12, Valerio Setti <vsetti@baylibre.com> wrote:

> Patch 1 fixes a pre-existing bugs, present since v7.3, reported by
> Sashiko [1] while reviewing the series adding I2S input support for
> Amlogic GX SoCs [2].
> [2] depends on patch 1 to address Sashiko's comment.
>
> Patch 2 adds a hardening check suggested by Martin while reviewing v1.
>
> [1] https://lore.kernel.org/all/sashiko-outbox-176054@kernel.org/
> [2] https://lore.kernel.org/all/20261018-audin-v5-0-4b8cc13a1b22@baylibre.com/
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

