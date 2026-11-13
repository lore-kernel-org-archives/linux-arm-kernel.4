Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0090A606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y67TsqSs;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ba92yVh1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=; b=Y67TsqSsx0kC22eXLLCTgtWLPA
	YpLlonZfqswQ1JcydW7eXQUy/s5n3Gr4R+sj2vZMbvyVlepNPwm/7ignR8m06F7oC6LeRCD8v6Mj6
	oWBcj5GS0w9j/rE681v6X4jOXVVzP7zwIdmPWK0RjJo/7Ee8UinRFX8kxRd+cUQ2oaCcRDg53IYPe
	/VICtjMBc04C44Jzf8gRdRFzyHCuVlS9CH1FgNZA8c+KXBfOP1Vur81Kk5Ajq324l3MLDwylFiTXb
	1ka6KPL9MdVpnZqtYP2geGWYWw/bmNiCnVJC16OyA61ikAdhqnqSVx+LeMpV/cQgWoZgm3q3gKWA+
	qaOEYt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqnY-0000000Cnff-2KSm;
	Fri, 13 Nov 2026 12:54:32 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqnV-0000000Cneb-1NYz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:54:30 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so1438643a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574467; cv=none;
        d=google.com; s=arc-20260327;
        b=HyYkUe2i1dDnlDYDKh/fCUIZMt5X8n7iUs7RjKE8jz4jzKNHlPJpfomEJjZsTmVq3p
         9V/+aUAZOxyU/AhmdqyT2Ml3Jq6jOekwVk54lnZFsTDly04zbEyJlHC2PLhm1gILZ4iW
         puaOCC9IKCH1J0bfdPnrptrY260rHRmAIyTKnHhnxOcdBJnd8oNdHqVvasqDgPGfvv0R
         TlDsHNONmSfKYDxqbNEtv9UMz6G2JIksOW8Uel4/LLtSdcp6HEQbveGavM+LbPdUY8YM
         mNMukIplMW0XDazPRQYc6oHCkxzb//jA5mQj4ZMamTZewD8SsDpRLo+CBN2cFyQXSDyi
         U3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        fh=SiyyLG+C1rvmrXtpLeKwsRynH1TRbdZ0KWlgYC1S8mE=;
        b=jnvePHuFDFlsOrTkpatjFGtl9rIe9xflXpMH4NsYh4nLWHXhaoRUXWKrTtN3XT/e7H
         H68XCVZyhuYorSClRmj9PWeI2LiMgf6YzmzkepNtgbiDTpfyGiMCVmW1A5X24QL2/nSh
         vaahuwJuCvoK+jeUceH2p9IypvlKjWsHfxX48e+SCix3m9GnfWe6AybYoN+YU96zo/Mi
         VzvFe8RjrD2dtT+uS8TYfUo54S1bv4j0p1qp60IZ4NTXgojfOHJ56Q4XUBPEYAt4EFUZ
         7IRq/P6yS+5c4tf+nBEBQTEm1dg0BqxXL3iDDS8CQsSt6RLqJwV81Lu9+wNXGF5jRrOk
         Wa0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574467; x=1795179267; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        b=ba92yVh1In57jmfYmi2dXqh2SSoe4IcJjz53cnyJX5b4oiEqXDu2ElpTJD4yUaWMkQ
         XgzibnszhzLVEN4jCKrVSX80L6oZ7yvCCxFX9xpYhICpklDZBgugdAPbqBh4eAjrmv5t
         FKTdXtgK7laZ9pV7dyEWdXQqpneiDEy3nEnDgH/oDXQFFn4FIKc4ZE7lKSr9n9t2Bgbi
         9BVM10dArR8UkxEIAT1Gr8QnUHfjYsoi2K/VxPsDHTptwvhb71peEW3cKvpSvDmWjxCW
         sI6VBxi4Q416dNttgEpkFcR9FaaZdbdjKZn0eCPDYVhFFJSy9Pdfi6RU/YFpqnRWkgNb
         AJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574467; x=1795179267;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        b=Mnc11l++in2RkebOTUqXbDroAKn0ZgZ/LE2wFgGAh6fNCqyVVHRhBPAGWK23wfKwwy
         H+V9GuLpUdiirJJa59TuLV/2462KvmuZLJ+Uhhvfwo+wwRbDEEST85744Y40PAKAYjbF
         Ya6EA1//HnQY94l8Y1dRZB+DQIPDAVQGKMPy+JZDUVo7jMIF2qP2Hdk6Arwol+gYjp43
         T3M7yZ4aE5JmvGbxTZfFx3sXxECzkKmCaPY0BwYHdZ3sQpZuPRcNtKVmr9w8mp39bvXO
         VjMedAsYEZkElsRAtgc2UlWlwxeT2Yga0L03/hzhHuacUm87nt+7jlNyDbvTAL8/ZgVo
         91Ag==
X-Forwarded-Encrypted: i=1; AL+hErH9w3K3V+ILBHZT3QFlZKqvPTVBuFtyDUdMuTZ4P+j46Qab0yyiNZik9m7vNpxm2L+V9R3svuPHITr8iL/ibnEw@lists.infradead.org
X-Gm-Message-State: APuU4Z/yNLhtfWb4GCf6x2puZ1X8r2uZrEupJGz0pFB97GDvH5+W8gyB
	qqwJkFCJ+EbEFpm7plELDeDpXXRL2EXsOegDpBUZ5cc7ttVi5SCb13nyW2pXIWgV4BkSK5mqnvq
	x7hm7DE3vJeibFqVnOsvQ/8JjBSzX8ILd3IR7726T5w==
X-Gm-Gg: AYBFou3BUMowaMY99qVzUg/EVeq3jsZ+niESccl5i70nRQDrW2Tn34kjhY3wMK/Uqfb
	Ha1RaUcnHvBH2TaZ66C/EEp4YBNWkOW1OcOv/YoDKRlLG6ypAUGKsj0E2pHiVeTdjKZaWnfd0+w
	hWbyswh/zCdp68zAnvdQAu335CwDBT2OMVw7pQlnfyYptP772iRAd04MxUmHh3+Bm8bU9Opk1P+
	QbX3H/JN4uf2nU1p1GNgAcSATJFvGc/24+sCaFUxYsx9DxvxgNjtyObVpFLjFOAgG5zwmeENtkY
	3HvLfvAuPSuJEsTbqg7kjHCFGj4ABuTSnHWjphSzImBBD03KxyMFQseQQM0fZpSEjI4qL3dziTH
	MLPC6etZOzUDB/ULFt3Ll4Q8WiZyljg80NTzFpvUFiN5DPcTs75pJVdRuSqHb2Y19njoUPA==
X-Received: by 2002:a05:6402:2804:b0:6b7:245a:a509 with SMTP id
 4fb4d7f45d1cf-6b7c0d166cfmr1777902a12.40.1794574467313; Fri, 13 Nov 2026
 04:54:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104853epcas5p175c566a1ced2547e533c21b21e60e993@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-9-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-9-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:54:14 +0000
X-Gm-Features: AclHuK9WcGq9tEUmProC1B7yOVe2Lz9yBCRU5dHo1y04eEg6YkemqWw0onfqCbI
Message-ID: <CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com>
Subject: Re: [PATCH v3 08/14 RESEND] clk: samsung: exynos8855: add block peris
 clock support
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
X-CRM114-CacheID: sfid-20261113_045429_420595_218641D4 
X-CRM114-Status: GOOD (  21.29  )
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

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_PERIS, this provides clocks for PERIS
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos8855.c | 97 ++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
> index dcf58f2459b0..12b5ae54b560 100644
> --- a/drivers/clk/samsung/clk-exynos8855.c
> +++ b/drivers/clk/samsung/clk-exynos8855.c
> @@ -18,7 +18,9 @@
>  /* NOTE: Must be equal to the last clock ID increased by one */
>  #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
>  #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
> +#define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
>
> +#define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
>  #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
>  #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
>
> @@ -1092,6 +1094,98 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
>         .memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
>  };
>
> +/* ---- CMU_PERIS --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_PERIS (0x10030000) */
> +#define CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER           0x600
> +#define CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC                    0x1000
> +#define CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER              0x610
> +#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP                   0x1800
> +#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP                    0x1804
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK     0x201c
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK  0x2040
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK          0x2048
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK          0x204c
> +#define CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> +
> +static const unsigned long peris_clk_regs[] __initconst = {
> +       CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER,
> +       CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC,
> +       CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER,
> +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> +       CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
> +};

Same comment about preserving register state from the bootloader when
powering off/on PERIS block.

> +
> +/* List of parent clocks for Muxes in CMU_PERIS */
> +PNAME(mout_clkcmu_peris_noc_user_p) = { "oscclk", "dout_clkcmu_peris_noc" };
> +PNAME(mout_clk_peris_gic_p) = { "oscclk", "mout_clkcmu_peris_gic_user" };
> +PNAME(mout_clkcmu_peris_gic_user_p) = { "oscclk", "dout_clkcmu_peris_gic" };
> +
> +static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
> +       MUX(CLK_MOUT_PERIS_NOC_USER, "mout_clkcmu_peris_noc_user",
> +           mout_clkcmu_peris_noc_user_p, CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIS_GIC, "mout_clk_peris_gic",
> +           mout_clk_peris_gic_p, CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC, 0, 1),
> +       MUX(CLK_MOUT_PERIS_GIC_USER, "mout_clkcmu_peris_gic_user",
> +           mout_clkcmu_peris_gic_user_p, CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER, 4, 1),
> +};
> +
> +static const struct samsung_div_clock peris_div_clks[] __initconst = {
> +       DIV(CLK_DOUT_PERIS_NOCP, "dout_clkcmu_peris_nocp",
> +           "mout_clkcmu_peris_noc_user", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIS_OTP, "dout_clkcmu_peris_otp",
> +           "oscclk", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> +           0, 4),
> +};
> +
> +static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
> +       GATE(CLK_GOUT_CMU_PERIS, "gout_cmu_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_SYSREG_PERIS, "gout_sysreg_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_WDT0_PERIS, "gout_wdt0_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_WDT1_PERIS, "gout_wdt1_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> +            21, 0, 0),

The Linux clock name strings look wrong here. It looks like you've
generally followed the clk-gs101 clock name mangling in this series so
it should be "gout_<block-name>_<IP-clock-name>, but you have
"gout_IP-clock_name>-<block-name>". I know there is some "name
diversity" in-tree for various SoCs, but with new SoCs using auto
clocks I would like to keep the naming scheme following a similar
style to clk-gs101.

Also I guess with auto clocks now enabled from the start you may never
need to expose all the CMU bus clocks, but I worry a bit you may have
mangled the names here a bit too much. If you do need to expose extra
gates you might get name collisions. For example in clk-gs101 we have
both

gout_apm_apm_usi0_uart_ipclk
gout_apm_apm_usi0_uart_pclk

So we kept the _pclk suffix in the Linux name to avoid a name collision.

Thanks,

Peter

