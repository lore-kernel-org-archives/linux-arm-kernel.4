Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C57F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Di1y1bh;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LrnzyG24
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=; b=1Di1y1bhwt/VWTDmK1ShGlok0o
	ClDoEbm1liNgi7cpksUrTlVUYbk8YaYHo8EA4kDuJsfCevKDLFvu2+s/m5ctPhRlG+GeGdtRWLsKw
	2Y4DF+WAh52VAl9A4+/FdE6ZOeiOEUSvt4bx21Iy0afXqrVNjlHoKzvAvrvMbm3D5yQlYIv8HVKs7
	/gHFgoLOohLlhtNhecLy5BEVD2YkN1u/HmfW1lkRnvhRWnwFsaVeF4OCDcU4hD+Pc7sdlQYbUV0xB
	2rPsNLajC0xIrNQiATi1AhR6/yEisdX2A7oAxhs/pXXVAT97APJSkydQxJO15hAZHa7UD1vfrssb+
	cnmQdrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqNf-0000000Cjpv-3M9C;
	Fri, 13 Nov 2026 12:27:47 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqNc-0000000Cjoj-2eQa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:27:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c50933bdf4bso232744766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794572862; cv=none;
        d=google.com; s=arc-20260327;
        b=Z8NASxsGmIyTrYvCUAWLgtePAaAsFLY+/Rt82hGAKG4fdxdAt9sQO149+qXGQkbBPE
         wuVjM44ao4gLA+y+J11XvhItGnY9mveEyFDEXhQEDq4z6OeSqUg/XR42GUAltQUTzDvp
         gwkQPI0e/7coIbGD18Y2eyGeKWRbMaH9yLAYzmNs+ayHNzSUhe1Xx5+earCRvZPWv/V/
         pKtMLJoxF/4kP7Jq91Z9z1W4InNlkpRa9DxOO9X4g0JBXhiOVFV3Lic/UnEKDNY4GfBM
         FAqA0m/i1lsTE0iiaW/obaTsRm+HGvA7L2IzDTxo1sg+G5fiDvXmltyk3NNGJuChhnXb
         WIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        fh=BPb7tHMhik0lA+vDPMcrd+L1Q3ajDujIV5TBzWIkAQo=;
        b=qNxPhgeKGp8oq4Y1KIa/KQlTFwPDUttzPfPhKxKb10YyRB4Ru2RKAlPg6L8/TtteUy
         diXIvrxqAShlRgxpmTNT6B3DLvfKIvsIUenCS21YUMyhgCXMMtf+JW0Oh33qIBWOmpgF
         /gXBEwUsZvyeBD8vizRKd5uFyoKLNoF0fuW0VgcjBEMDWh/QSmVwud7HgU7HSQ9jdu2Z
         38INq4kI/eL912GHH87w5v4kZyLjTcc33FFdkCTuA/9RYVgp+XIOf3ITb51yCl1++wcW
         DfCltjG0gpQljKezIPyQ5jYU7ThquitpGkKCR3CrOA9xy+OlcHdwV2GQVOcZzMVg4XwV
         Cjfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794572862; x=1795177662; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        b=LrnzyG24Ji10hZHdhzPSS5XbxcOhdonARwLAT+NV15djfeaG7E2XCCdZmtfwTcMMrb
         vXMeF290MTz7fe2dea5li2Pf4otfYh7R2aucXuTM+SmsOTGJAr+JX9OzkGd1BgLQ+H+t
         bKvAZ7MJowm21sNExXo5xapXpFddKWFwRQz43pNWnAnhOv0QkiohNRRumMdC7kL2hHbH
         kpFp3dVvpEejPGaTAsPkPWJx3sGBHk6+nfwe8flzIDvpiASx/wHMoHiXHT6QCm1hW7vl
         LTrwF3GwVgrrZGj4czXJ1oQtT38f/M5wD4bX1lDuKsL7bi/IshPacuh91MX3FFP05FJL
         g5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572862; x=1795177662;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dn1URtd87rhGjVipjwsiO0ogDiCqEYx79Gj1SyGl1js=;
        b=HQ26oslCQjitkSi1FHSkMkfpO+73ZA7y1l3QolURkaKP/r/FsJvkVFBI8MSIaDZun3
         i3L+rEOLXFaGyTCRIok+1bv7w1qSeI3MqQoVA3zRpCEXw1fZIgpnaB+GC/qgdACrEayi
         JUlX/c2DtJQa8i93HTgzhAf3TcKsJu2ersHxjrexV1RTfDqQFJMjJxcu003aaS1sd9do
         uPWWkvDJDYqdHwKhLV2coWNUbdWs0bz2gtrFFZcextoNK9jgSmANpoRbYE5vJGoazhwO
         vnHt4F3qb/aOgd/fpE+0O+wnH3k1NLSYmX6RfbVy623ytIFkhvVbmrtZ1QDG57h1OvMx
         kaFw==
X-Forwarded-Encrypted: i=1; AL+hErGlc0d1JdK+ysOQZqWHx2SqJesVji+E7XYeJjiKrFtIn1M3zPQFW2yNvk/B/WNfggL0fTzE0AJSy+wQYdk+ENLE@lists.infradead.org
X-Gm-Message-State: APuU4Z+nOO0KKWQmCmfLUIytgod8KzI6zcuCoRR8+QHv77GRVkxpki5c
	MhiUKwb1J5hg9hfvXB3qc27yBP0apPNYXsWSb496a4o2lPo1RrnfRSrGM01eF9wrXQ+UeLzzB2z
	3yJqTFsMij2FR/XzN8JRg7ZUbQqyWYQOMiuvpj/Zfzw==
X-Gm-Gg: AYBFou1+oKlIs2tXUS8mf2Z9IH/xdtXe4MNQV49F3wyyACfjdn2ZTm5H3yvib0nXiHE
	7pmOHMPin1TnzZZ1SICgwc5e/sd6aGln6ngNCukY/meB1XbHJwW9rJdbmE87dQ0MZlQPKkvXQKM
	18ybZN0xqQdfOfVAcAD/SW7r5D7uMjN5xxxkRRMT6QkHiws/b4VIL4vNG7rr2JqCmPr0L2vsIDL
	viW3kTkg93zTRv30ceYPinGVBu97lWknphAl8KmU+Pi+s+ZL4TLxOHvPSTmvdBHbR5Am19Znwky
	lXosikzsfco74wP/KVO04c/TVg2QvNeNLfoW9GrQ3/q2ffPPZ0i/LOiiz8df/R+0LpBbD3hBX3y
	pFC1ok0+TyfhJeYEfKs52U13OnPsx21P6TU4LoZ/8mLNeTcV8zcll4IJBPTlUrV6gHJH5dA==
X-Received: by 2002:a17:907:3d8d:b0:c36:777f:824c with SMTP id
 a640c23a62f3a-c507b3944a2mr522415966b.4.1794572862414; Fri, 13 Nov 2026
 04:27:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-7-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-7-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:27:30 +0000
X-Gm-Features: AclHuK-p51p0Vx5xI8MvGi-0HN81TalHpuLQqDi6SVVgi93XmBwCD0wdDg3iAr0
Message-ID: <CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com>
Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for pll_4313
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_042744_689232_3F3C3889 
X-CRM114-Status: GOOD (  21.95  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Raghav,

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> From: Alim Akhtar <alim.akhtar@samsung.com>
>
> PLLs 4313 are found in the Exynos8855 SoC and it is similar
> to pll_531x except for CON8 offset, so re-using code for
> pll_4313
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
>  drivers/clk/samsung/clk-pll.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 3d837bd74355..7b0756127306 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -1306,7 +1306,15 @@ static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
>         u64 mdiv, fout = parent_rate;
>
>         pll_con0 = readl_relaxed(pll->con_reg);
> -       pll_con8 = readl_relaxed(pll->con_reg + 20);
> +       if (pll->type == pll_4313) {
> +               /* Offset for PLL_CON8 which hold FDIV different for PLL_4313
> +                * which is PLL_LOCKTIME_OFFSET - 0x4
> +                */
> +               pll_con8 = readl_relaxed(pll->lock_reg - 4);
> +       } else {
> +               pll_con8 = readl_relaxed(pll->con_reg + 20);
> +       }
> +

This starts to feel a bit hacky (pll_con8 register being referenced as
an offset from lock_reg). Is the register really called pll_con8 on
8855? Or is it called something else, but happens to contain fdiv?

I think something like this would look cleaner:

u32 fdiv_reg;

       if (pll->type == pll_4313) {
               /* fdiv in <insert name> register
               fdiv_reg = readl_relaxed(pll->lock_reg - 4);
       } else {
               /* fdiv in pll_con8 register */
               fdiv_reg = readl_relaxed(pll->con_reg + 20);
       }

regards,

Peter

