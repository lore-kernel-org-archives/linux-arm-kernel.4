Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5BC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yZlrG/71;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=H9W2abXT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=; b=yZlrG/71T5Jua3
	neDjn6dJn1eSZI7AUvPjmhR5Gca7E+xiodFG7uXnTFLJViOyVDahpawfWG/7Mfup1o8zcdTWlKIBQ
	V2UjDz04kAZ8ymfnK2ORu522m6eJ5ZW3O6WhbjL95RVRMh1ZY9wtBkp5xSlJ8xcAaNN95A18y/ak4
	OKBvUFEqA6g2gfp77wbTQop1ANGpGYPDwSsO7YJV6i0QxdKE5jUCPjeUgT1gB9m398Q0YwE9gJ6MA
	fVj0P6V9R204aY4j9bL1lvFh2NjBvMpyF/mxyj7I4p9Egohw8drb0AQJ1rOJ/ftrZNl/ExjuhHKUT
	AUI0SKonvYDSJNxAmzQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9Te-00000001GKq-2Qcs;
	Sun, 22 Nov 2026 15:27:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9Ta-00000001GJw-3MPW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:27:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso29168515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 07:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795361253; x=1795966053; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=;
        b=H9W2abXTDpS00uSM8dADMkp3KlJYl+7wieTXK3nu11VTV1GjAXVfz5Uh4Tu6zIqMhK
         24mJmB++kO/kKgZVb27BGN6RAPHuTOZ8XeQwaWsdHJHYiy5YpldOgR8hgFdAw3Ykkx3b
         tT0F4VZgQ4PTuE6pPAMomNbbaROa4foOFe+WiDXOX4CXaEt06m76qb9zx33ka/0K2kPT
         KNvBhykexULBz74cDsbesSsrYCpRlvuxuWJzbEyIJZ1cAWss7EG4aufhPxVsvsyKHrt+
         0IP+uAAQoVfXYc6SX+MV5j8R5Hv9H61dup96rWIjH66aJjoxQI9yzSUsf//OKaTSuA8z
         5y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361253; x=1795966053;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ot0zJlzFbVCe62Kvau5YPtTDd6GdHkdbEpE1vxuLRFc=;
        b=XZdIwcJhtd5KDYJPp5zyYsvYMHzvvsz8hOTBLNOQVLPU1dd6NxrIjpxz/HXI91JXLv
         +THcrra64g4e2IO8UqPF/hdhsMHJAtqB4kqzZx1UIyDwD7bBGmUC0rwxeBz1iy3M2GLd
         QE6wAoC8TFWOkh5KcDOtH/kwDI4AFtJqWJLewtOUali7RAeEgfnUtl6RNgZb8Z9e0aK0
         xXjWareiG7Y/mTjv3vz5mbxe0oJU+Gc22vs+LlsJkfOKtjB9/KxJLa3NeQ4TVa19RZW/
         sXSFt6WkO1MBLozpRlqIaAAGw+6TghQ2+kYYXsZNxPnUmjCkQLaiLFbszm6L43To0MSC
         J2Ug==
X-Forwarded-Encrypted: i=1; AL+hErFiKTxRMO2hBqMt/+SMWY2ifoNsXohrCpeTfS+wPjBxbDNJd9+iyy6bd+VKAyeaSeYynHB1MTcEvpJtnnG/Gjjq@lists.infradead.org
X-Gm-Message-State: APuU4Z8TAs6hXLr3S7K1XpN8PgCp0uLky0NUgZmp9dhB1kOHdWAbw3J/
	YBVGAlWMJNcxHqagIUNiu48V6XCe/cPv/elY0liZ/5nGPzOcCHSkTFXw+Xt4eoPobZc=
X-Gm-Gg: AZFdTZeIih0Y6LLs6GfwgUOoT61wJ6Sjdf5ESZjdnObj23eVSg3beo3sHifTKEobEvN
	E27siJSA5YApQ6uJXK04o0+CEdEqi96g2e+9qfqEOXpcTN0M5Q6v9PexGTbvckrAfhPnsakYsA5
	eHLfngobyKXYWkryiDGeTx8FmKpA9X5O/pqK+CcsSH3tU3lSGCEn279vorDeI9V2Q36+0rLhy9m
	9iI6mqjcaUmgzku2FjIqSWc+/vnFpP/4xAvzH13paOQj0vfM1rwC58eqldmz5RjhA5t3JALfwzd
	ANclA7tssK2wYQ0h+jlPK0DANoX/AC3nitUPGQ9PfrzJN+qqeKTwf4LmqBMYuWC67pDwofZHQI1
	W/nPoqGODJlEikbSBoz1XG2qx1OzqDBwZ4qNiYd7j84wJoyqkZIzLR/R22Z0tYKFZemEOq7ZomM
	/Q3qkkwq6So2+YCLPrqewCSE+SJ++6fgOjq2BWRcBdUp+3oxqsqD216rgttzruZD+2t8qFBXdkD
	2oXtXyZ+HvvNnt+Bfve1jfVsOdTyi7MDxaMnO1a8FPramkBH2YXhjNlt+7D46of6teONoDpmzOR
	T+wcPd7j7BG1gnU4nEonTjSW3D0G2ruq4DHguiXOV9o9dmh7mw==
X-Received: by 2002:a05:600c:3555:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb8881da76mr187712165e9.34.1795361253164;
        Sun, 22 Nov 2026 07:27:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm324114005e9.14.2026.11.22.07.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:27:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 0/5] Add support for S4 audio
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
Date: Sun, 22 Nov 2026 16:27:28 +0100
Message-Id: <179536124894.2728475.16240917993133855473.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=SakUBu+Tj3UYj69tUpTC/fsgrcNkMteoX+Lt2iuPgXc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMnE/+NymUzd4hva7CSmxX3dxLJ27tYynZy6qYorFaU
 uexikFzRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbCdIThv9fc1off4xQusP20
 lhVaw60es6lqQ/uRSbU8X05aMdusWMXwP980O55/ScYJq4WsZ3SZNh+93vxsmyBL/v8zj3qqwxS
 YuAE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_072734_860455_79BE04A0 
X-CRM114-Status: GOOD (  10.69  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
> 
> 1 Device Tree Bindings Updates 
> Added audio power domain and S4 audio clock support for S4 SoC.
> Added S4 audio tocodec binding support.
> 
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Added S4 audio clock support in AXG audio clock 
> 
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.

A clock immutable branch is going to be necessary to handle the dependencies
in this series. Please re-submit with clock changes only and a proper cover letter
so I can merge apply this and provide the IB. Thanks

-- 
Jerome


