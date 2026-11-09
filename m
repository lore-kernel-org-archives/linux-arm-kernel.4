Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D56606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W3I+oD5K;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJAkJOZp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gCHTfCW97KpYQJTKEFqZ/ymfH4VJHD4E4IGyWOcVdiE=; b=W3I+oD5KKjqgZmFqTF+Ur/+tip
	UcZ73mq61MBp8GrvZQy16JxUjEt62JfsQiecjzYK4toJ/jf3VUF0KxgVgJqWbRH4HRPwoMy7AdhMk
	19TV8tDSiq3lgjK3Wkw7nCkrpz9zZ2Bra0RDRjCuQK+sZKlXep0iY08AbfWTcSRCvOGu1jnWN6vf9
	Ac7WVO3L626xT/6BTVvQWDeZQnVMVEOYSH3Ojj4sxb5+uF8QKO2np+HL+XUyurcVj9wypSoEy2zZP
	dJxAcgXwIh0mTZEjftSJbztrZwghTi52a4Pb//UOQ0k/j2SjCSAq1e2vTsdkPpIf+qW4mnoX3HUE6
	DbEUArXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOTg-00000000g56-3CVg;
	Mon, 09 Nov 2026 12:28:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOTg-00000000g4R-00cj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:28:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 736E9618C5;
	Mon,  9 Nov 2026 12:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7641F0089F;
	Mon,  9 Nov 2026 12:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227279;
	bh=gCHTfCW97KpYQJTKEFqZ/ymfH4VJHD4E4IGyWOcVdiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJAkJOZpQM6h9sgGDj6agmWdRQPGL2hS4t1t+waOoqK0Hnfy359N421qqvgXVJEf5
	 AHdF2R7HuIwvmBMGzneVN7q+NSOit4jPiTiYqg5J5QkxwtG/IR+K2BGrdMqs8aq6Vs
	 AbTOemJ9M8UX2lWHfBgm84bT3BROYbe80y3/TuVthg+IL+W2uDfZlo+Yc+x7OyF+DX
	 PAojDZY9cT6NhPhGxGhjJxuKJ7UlJwdHKPBJoBdUsyo8MzYricxCBLSYMd+/sjWGPm
	 ibp9KckV7siLxVuLRwV3xyYTsUj4ebyKt1cmdiUZUMdU9ZZwfFpCcGKEgYRorJlH+n
	 fVn9AYn9OJ7Sw==
Date: Mon, 9 Nov 2026 13:27:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Subject: Re: [PATCH v4 4/8] dt-bindings: stm32: add clocks for Cortex-CM0 on
 stm32mp25
Message-ID: <20261109-radiant-bear-of-sunshine-3db3cd@quoll>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-4-9e32b817c38d@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-ups_mp25_clk_update-v4-4-9e32b817c38d@foss.st.com>
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

On Fri, Nov 06, 2026 at 05:16:34PM +0100, Gabriel Fernandez wrote:
> From: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
> 
> Add the clock identifiers needed to allocate the D3 peripherals to the
> Cortex-M0 (CPU3 domain) and to enable their autonomous mode:
> 
>  - CK_CPU3 and CK_<IP>_C3: allocation of the CPU3 domain and of the D3
>    peripherals to CPU3
>  - CK_CPU3_AM and CK_<IP>_AM: autonomous mode of the CPU3 domain and of
>    the D3 peripherals
>  - CK_HSI_KER_ON, CK_HSE_KER_ON and CK_MSI_KER_ON: kernel clocks of the
>    HSI, HSE and MSI oscillators
> 
> Add the matching SCMI clocks: CK_SCMI_HSI_KER_ON, CK_SCMI_HSE_KER_ON,
> CK_SCMI_MSI_KER_ON and the autonomous mode clocks owned by the SCMI
> server (CK_SCMI_GPIOZ_AM, CK_SCMI_IPCC2_AM, CK_SCMI_LPDMA_AM and
> CK_SCMI_RTC_AM).
> 
> The three kernel clocks of the HSI, HSE and MSI oscillators are also
> added at the end of the RCC input clocks. They are optional, so that
> the existing device trees remain valid.
> 
> Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp25-rcc.yaml           |  9 +++++-
>  include/dt-bindings/clock/st,stm32mp25-rcc.h       | 35 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


