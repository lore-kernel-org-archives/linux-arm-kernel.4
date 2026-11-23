Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106E0606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pBQ8kJcB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zVMQUZkG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3VcpHnSiwyTeiDddBV3SmBxGPQ1li3vFXIux+h2TFxk=; b=pBQ8kJcBRv+VWIfTiC67IDjtkD
	HIn/tC7hscJiKY2CvHUdogVWH+iWJUE59zMaJN7EI+Hsyw3rQe6QPR43zAH7BuagP5vPAHRQ267wv
	+EP52lx3/nHRiL/FlVJ7JrDi9okm00iEdZV3OpYUWp3kJHCXhNoBsyDYAHMXBlpa902oIIsCRjahP
	fBjZ/8X2ZteEZtW38VaHeslTjt4OqL6lCP5Q2ILELT2XNm+V1+CfaiEFek3IzXKTSCGyxUR0EqNJL
	nAaje8G+bkdhaf2YZ6Dif1nalxxyuM0BmgY9NzJ50Iq/3zYyi73Iio0IPdzUAQ79GlD/Pxm2ixD4e
	1SYJFfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVabX-00000004olt-0qvr;
	Mon, 23 Nov 2026 20:25:35 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVabU-00000004olC-2fcL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:25:34 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-15ea896ddc8so6274313c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 12:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795465532; x=1796070332; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3VcpHnSiwyTeiDddBV3SmBxGPQ1li3vFXIux+h2TFxk=;
        b=zVMQUZkGcYjBLQEcHvzCLkhlcfeVu0vRQD4TIY0md3C78kBHbB5FJmzCDumpmV9IDt
         SGLQdYUIY9wsIGbMQnilGxwXPPqKDrWm+X+HwEaATcIzVaJFvUe1+7g+j/fHNstJEUj+
         bjgCGwozH4+4GfNOSeTZQQ14J0Qptz81boQJqmaGYa85zl8rwWOb6TROnv1uhRxaV+o8
         J+yqnOJMNZbcS21XF9Iu4TZEn62fDiU8sfRCN8d3Qqii4qzSswUOhYbUyztcBNUMYAG5
         hNxj5ochOn/aPDLlUHrk6XcaaSnPpZ3IpuPOjsDdrMAEwGJQ8UVvRSig43h25DLCOjSp
         FJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465532; x=1796070332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VcpHnSiwyTeiDddBV3SmBxGPQ1li3vFXIux+h2TFxk=;
        b=L/h6iKoZGdmmLqqfKS1qBg8BRBcs0yK4POe9V1cETMVDcXD5cGeXdSrCsUjvT+4WCu
         awivuDopMQievpdf4Gq87c+0iFfg3hx9Ph6+u2E5cgto3DwNnWemLKKYMFpjbfl6cesO
         oZzY/TAbCbGExdrFHSgjnp3570MJtAYt23XLzAyKZzT/Kvr5iw560UdDOgioa9bArB7e
         Ms3/zQc3tzlGu7945gGtx4b3bmCgvt0dl+7xtQw0XE6rV3YncUJsFmMm553xhsqz3hQj
         7xdKm363p5kh9bIl3+L/RyXFFTSWCjW+CMEo1nDHc/5p33B/AmGIOgyOrAyMCSk83B6M
         Y8aQ==
X-Forwarded-Encrypted: i=1; AL+hErHJnDAn56l8qTKH8UtBhT0+gtTknPLBeDhsCoSyiJPXglj2Y5lgPDuP7hc0ncfngUtFKdtvTqC5OHlZUO7rwAtX@lists.infradead.org
X-Gm-Message-State: APuU4Z8JiYbhgIb+nr35E3gWn/xboc/hEWv+ZteW7zRnIbHzVqF8fKTn
	yV4vKIdzgi5CWw8d6MMlw9iaLf3A9ANgtSyLarARjaDXyxO9TZuF/7gR
X-Gm-Gg: AZFdTZeuNG7rq4esFM3quNRDbDfzfHtOSx39ikmFupLxg74CiVGx/tB5Kfeo1vnbc5R
	9l29IPyZ7mpmCKd4HOM+GIWFsVIY3NpJJSY2WP0J8FnmC9Ij0xij6beGDQb3ixwGT8uJxGqrpqc
	Id3kMqPIBwYiP1PSnpSWdtMpRp2Ha2SkXGzG+WupYdkTohW5RNMvM5XqBfkv5ReBIqx/yV+crhP
	aPBB+lsHn3EQ9BsYngJ1Q+ibbpVjn9yvrIbBcCFZldRA5lQ7ah+4+6QzZeSCehMVuZCA4GzSNfV
	aibWDu1p9LsuLxIu69owCvYwaZpu8y89FHIY24O0mPu8QxMqUo86+/NfMgfmACwA/rUoLezgGDU
	rMrfB8MvJ6xpiyYKoGbyTI50aidtYydiBiWJfOAZTbQQywu/pTO29icpmZoOzT4DUlwgrlBRPgs
	jAc/n7nSyuBNejVhpWhPL8I2T4QJ3WOSCgMDy4JQjr9hzUB6zfs/p4508mWxF5Mp0MaDm3EMeJ8
	pZ6nLU/PTJE3M6ApvTbP9wzmYwQ2r76GJASNzQ3HMJu/qfE6xReFN+EjnybhntbCKXBoVgNf8l2
	fGSRU9in0uQ1hT5PajULFtOfV/2BSA+6Zn0E4Cl7IW4sGgVwUfm3mVxF2foiR90LxkAaUPU=
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr11976416c88.22.1795465531758;
        Mon, 23 Nov 2026 12:25:31 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm29277191c88.3.2026.11.23.12.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:25:30 -0800 (PST)
Date: Mon, 23 Nov 2026 12:25:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fengping Yu <fengping.yu@mediatek.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 08/10] Input: mt6779-keypad - enable keypad clock before
 programming registers
Message-ID: <awShM65vJT7DhZLT@google.com>
References: <20261123183200.3900004-1-lee@kernel.org>
 <20261123183200.3900004-9-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123183200.3900004-9-lee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_122532_681744_3F0A422C 
X-CRM114-Status: GOOD (  10.54  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 06:31:14PM +0000, Lee Jones wrote:
> mt6779_keypad_pdrv_probe() writes the debounce and matrix selection
> registers over MMIO before acquiring and enabling the "kpd" clock via
> devm_clk_get_enabled().
> 
> When the keypad clock is gated off at boot or its clock provider defers
> probe, accessing unclocked keypad MMIO registers can trigger a bus abort
> or silently drop the configuration writes.
> 
> Acquire and enable the "kpd" clock before accessing the keypad
> registers.
> 
> Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
> Closes: https://sashiko.dev/#/bug/linux-fc15622a-407a-48b2-88db-195cdb311dbf
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thank you.

-- 
Dmitry

