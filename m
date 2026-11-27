Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59B5606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 23:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zTgZl2q3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPx8MvIo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0i1G/+YpV4sZoXtvA5HG/1gUD16tCeL0tcOTZF5OSg4=; b=zTgZl2q3x/iP38
	DNQ6t0C77dmP5f8fTsGqUdD+EIduXwfgatKRUqz6F3wWCo6zNG9aSQdk5hLKt0/sYABtVP04igTeA
	Bu9a4ewf6QKtGlmyga8YmVlmdSbrk8qljunwK6blijDf9x633931UnB5BrBcB70B01S4sa8PSir9s
	B55/J2IF5hESNUVm46tNsSVtKL8pBfv7qZQ45pVi4A8cHZhjmEl2l+nuFnGMEZ6ehJQ/QpHKMeMJC
	WdgsjbNFbSPCQvlqlIWWCS8cf4eHoqWOaQlefgopC24QvPrt/FgwE84GPjKfWl6BJp/wzmKtT9idt
	+1qCBkj+n3ca/CyzEdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX4UR-00000000A6V-40Y6;
	Fri, 27 Nov 2026 22:32:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX4UP-00000000A5w-0oTx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 22:32:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e46e449e8so5639457f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818738; x=1796423538; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0i1G/+YpV4sZoXtvA5HG/1gUD16tCeL0tcOTZF5OSg4=;
        b=nPx8MvIoU6JsaaNBTzS/s2vgA+l93jXiquKJewjVRD4pQtICYLHpYeR2x3adIPkhWR
         RU49vDhLv4tDUFyNIbGx0JCdvKoldh4MDUN9feZOH1AZUkdnYqDUCsX6NkQ114HCfPZ/
         JO4AYzZzbg8LYQ5H4N5g9qSFFN9Otb7JoyMlH3hb30BN9cM994im0xtg3SZfRGCjwqZK
         aXaqcIoaY6TRk3PsSA7WP6FaFL1Ffb/S79cz/vvWO/62aLlcvPeySFGohCwslRvOiPTr
         XQyfzzf135uX2OEF0BDgP+I0vItjjY9CKfLrel4bi4p4kErMD5L02oS4HltlIKrIK9Ff
         RXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818738; x=1796423538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0i1G/+YpV4sZoXtvA5HG/1gUD16tCeL0tcOTZF5OSg4=;
        b=BWnCAR4HZdxaVRYbpods7Ta1wEZc8WQKDApFQvV2PQtLzXhpFamBcuYY3q3I4/0w62
         cSgu/oQ8BPqUTf1CTSjuTGDg9Rf89a0fasvPueKocjbzRsUOYUZdlP6ZTq4MW6RX50sz
         s2sR49Gl/vM46VGf8enbRofyyR7csVwoq1PIA2t8ouV68LCkbCTggQxyqVSqFApN1UZ6
         R0LtVJpCP/lyMolMgrNwi33MB3AiyepE+AK3AIZeHv9umWaSHAvo3BUUbtc1ia8G7a1h
         AAwBjN687sQF6E9hIYStidFTFy+qPFQ3nbQzRHkLKNFof+Uk3ftgOE8XQkq/eI1Be3Vc
         S8qA==
X-Forwarded-Encrypted: i=1; AL+hErEzMj7H9qByq6g5qYCe2HwE5iHM1L2J/7a+W5TRkKCVqzxXtmssbQXzBjYGs6M24mAhYtLp9BG1+SEmWECUe/vz@lists.infradead.org
X-Gm-Message-State: APuU4Z+gp9quXUCAKIFIzuwnbAVbPW+t0T3fCRoXe3qpe2W2Ck1efHw+
	G4155eAvzbcbpzMaDtRay+7EQwKFlwOBW1WaFQTwc+XIRcsXjM7KuiqTN6mdKdc7AfzeOQ==
X-Gm-Gg: AZFdTZdG6vPI9e0EcgECuDrEXWeiRnmHWbTkFCnPbzzgXqsN3SUnlhpCs5BWHeTAJ4k
	KFypCvLY3K8r1VbvawhdZkM86r23KjhgLrLH0NgrlWBWbGShyvIXgVA17jr+H56PQ/9JT3r+k3n
	/Bmd7blkRzT2W7Qb6Ok+ZjNPoNWQXKkM+FF5tzAxB+rbi3xR+lx9hxxq+Y1H7opUPr7Ow9b4COJ
	qjudlJmCWwQgbL9hexRQ/E2bPMq/laDnyrWUsEhqbIIi7IFIDpSQsi4CKoda09izthVgbQH3llX
	kDoTneFp3DQfa7E1iVHnmWvrh7AM+DDg9eEaI4Jp62esHGtFrbl3iPZJvYj3ybGqB1CNRgmh5GN
	g32PK+WN+wGqxLbUGTWDrhRgZXTIkyzTbywzNslPTiSdt98439TXfNmUgXCDoUTtYFevIDc2gxo
	6/NAigvihbPQ78/XtRxKAdgx5PMLTB4OlWVmKyFa20K5oJE4eN+isj7RqvmZrHsz5Nc2EX0l/ZZ
	Ezs5bMltFNHIVnMAoykjuXfxfq17q8CP6lQij+lLX93EkPxIl6wkinQYnH7iyAsNOmkDTIt3NRC
	O4vc4hvVqie/fzoV5vPQHff0dSmVshMefM0e+8Yits1KgQY=
X-Received: by 2002:a05:6000:288d:b0:490:a3e7:8af3 with SMTP id ffacd0b85a97d-4abb73b516amr57641981f8f.35.1795818737759;
        Fri, 27 Nov 2026 14:32:17 -0800 (PST)
Received: from localhost.localdomain ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm49465507f8f.51.2026.11.27.14.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:32:17 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <joe.skb7@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
Date: Sat, 28 Nov 2026 01:32:14 +0300
Message-ID: <20261127223213.2481987-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DN5A4ZMSEDUO.FUSGQTLBRYFN@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org> <DN5A4ZMSEDUO.FUSGQTLBRYFN@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_143221_236200_4F777949 
X-CRM114-Status: GOOD (  12.27  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 04:23:15PM +0000, Alexey Klimov wrote:
> Regarding number of channels. The Exynos850 spec says that ADC has 10
> channels and, looking at the registers, the ADC_CON2 register (offset 0x4)
> lists 10 channels as acceptable ones.
> ACH_SEL bits [3:0] field in this register wants to see numbers from 0b0000
> to 0b1001 (from 0 to 9) and lists numbers 1010 to 1111 as "Reserved".
>
> So, I tend to say it is fine to have it set to 10 if it doesn't trigger
> any hw issues.

Thanks for checking the spec. Then 10 is right, and channels 8 and 9 are
probably just not connected on the XCover5. Reading them caused no
problems here, so no objection from me.

Adil

