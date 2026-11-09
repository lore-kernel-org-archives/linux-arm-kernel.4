Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E4F606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bLJ65HEZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNaJTdro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2fk8QtX0+1VyjhcQimuCaGWSsBbHKuQjRjuFEVWcw2Q=; b=bLJ65HEZm2EZn1xm4ePGUT7V3r
	oLP7WcHqRVUlVMXrA2BMYmpR6epxTH19CBdKidXApYXgydY51kOeI8EILEm4gZVkbWDPetqYzehlI
	1DyC9IFJNjuaby+Alft7+pl8/vG9xgqlDU0xSoG6X1+UlNwqwaZN1mXLyXbGemc0XsuY1BQMnkS5Y
	QXsEDkvVYg1kW04DqUY2DbU3HLpXeaz6qwSyQZSzbMrXe0aLGvaiOZ6V6IiCrZI4ufzCiGNXS+QB1
	WPuJjXRGD/d4lPBzmNeJftRJBuC7uO1x21bm1neNdEwV214vCgEDTS9/nIk+Y8VpRRlqo3MN5g16j
	PlvrN5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOTT-00000000fxb-1H0b;
	Mon, 09 Nov 2026 12:27:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOTR-00000000fx7-2fVx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:27:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0D3E631C4;
	Mon,  9 Nov 2026 12:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6904C1F008A1;
	Mon,  9 Nov 2026 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227264;
	bh=2fk8QtX0+1VyjhcQimuCaGWSsBbHKuQjRjuFEVWcw2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BNaJTdroW0NW2Sg0vMhqzSnHgTK5NcXGRBPvvhz/PAbhO+sdKaRGSdMlpaCxACDeG
	 /mxYEoPK5U4ngmavKkhWp3vPvTLgERpmbWhrF2sTNL7gKEnvybfcsoqTm6iSbdGh4O
	 HTtyWpMZCgmgJQjZ+QLrj+0cva9hWHNp93CsEhL6NIJL2YFe8dj5/mU6TXzAGh9hB4
	 O2FVpmSTHoM2G271lExw5ETwODpV+cKw8LiKLVABxhILzdFds7LYst7TxNMm/pa2H6
	 vFW1RM8G7fWuF7ceRekv+gZW+OBDUA9tYz+CAq5uiPn7/oLDxsu6c5v9IQnU87j1bS
	 tagA/8rf1k3EA==
Date: Mon, 9 Nov 2026 13:27:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/8] dt-bindings: stm32: add kernel clocks for ETR and
 STM
Message-ID: <20261109-heavenly-orchid-copperhead-3ddc0a@quoll>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-2-9e32b817c38d@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-ups_mp25_clk_update-v4-2-9e32b817c38d@foss.st.com>
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

On Fri, Nov 06, 2026 at 05:16:32PM +0100, Gabriel Fernandez wrote:
> Add the kernel clocks of the ETR (CK_KER_ETR) and of the STM
> (CK_KER_STM) for STM32MP25, with the matching SCMI clocks
> (CK_SCMI_KER_ETR and CK_SCMI_KER_STM).
> These are the trace (ATB) clocks of the CoreSight Embedded
> Trace Router and System Trace Macrocell, while the bus clocks
> only provide register access (APB).
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  include/dt-bindings/clock/st,stm32mp25-rcc.h | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


