Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BD1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IhvhobI6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fopXDmVo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hj0mLQTbYwlxqjWQICMElpvI8PErrkWWgWwZ4J2oTr0=; b=IhvhobI6fImaUF5W422QABxtTp
	zXTzpny1Z0uCOkPWa5TRvTjM7iIZI0JrGXgDGVxgbGo/PxUJAKahWwnU1kxEJST148+ZMgMCym9qm
	fGP35vS8D/Erxio4xeFsZOdUFJappGNIXQvF31Z0k43MWiOfukhjXzFnZJhecmEvs5NSS6sMYZvjX
	r0Q78tUrZxpfkHVViVB7a/WMNP/fQ5i0Zpr6x9rJCAGDjxjy8nPRZfyvsk2eY43/tGuR9yHoI4fJp
	q81XwfkbZfpgskQ+6RbBGlqQ/6le7b3gaHweuh9IvBPCjKKL15rmtmiarVuGIVFhNT8wTqgg+lObL
	R6imfLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3g8-0000000CJhq-3T1U;
	Thu, 19 Nov 2026 15:04:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3g7-0000000CJhS-2njZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:03:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 44CC160D9D;
	Thu, 19 Nov 2026 15:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FD61F000C6;
	Thu, 19 Nov 2026 15:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795100638;
	bh=hj0mLQTbYwlxqjWQICMElpvI8PErrkWWgWwZ4J2oTr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fopXDmVoCTo9q4U7FaLcnpixE/r5cBKsGpAfSyLOy+q/5KnEHoJpt9Rgk7KNJFQbk
	 kfmEcuowIjFZZ98wyLbo3/09k4bskb2tZwDz/v83L470WPnLjb8ha5+mX9ejbtxG+T
	 8QzyY5sFVm6saOVGnTjWu9IPp6/x4Ve9lxpI1arjNWNNNy9zrngnmE/gE04lNMvOOL
	 P1VPxBpmlDF6wBjYs2z5xDHmqwUgL58Sigtp6ETTxyGC4wYyKFa1fmtRFPtO/Prdr6
	 6P2b1xqIPHlEGjdpMQIjPU17xixCRa5TKNc/nIKDaOCuXTBMALGOpfg3cW0skVKmqF
	 ZgxL+RPDUCDjw==
Date: Thu, 19 Nov 2026 10:03:55 -0500
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: Re: [PATCH v4 8/8] dt-bindings: stm32: use reference manual names
 for ETR and STM bus clocks (ATTN: Krzysztof)
Message-ID: <av8P26kub_rYdnFX@x1g10>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
 <179443632478.1143992.14086932638988907034.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179443632478.1143992.14086932638988907034.b4-review@b4>
User-Agent: Mutt/2.4.3 (2026-10-09)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

On Wed, Nov 11, 2026 at 05:32:04PM -0500, Brian Masney wrote:
> > The bus clocks of the STM and of the ETR are identified by CK_BUS_STM500,
> > CK_SCMI_STM500 and CK_SCMI_ETR. Now that their kernel clocks are
> > described as CK_KER_STM and CK_KER_ETR, and as the RCC bus clock of the
> > ETR is already CK_BUS_ETR, these names are confusing. They also differ
> > from the reference manual and from the STM32MP21 binding, which uses
> > CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM for the same clocks.
> > 
> > Use CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM, with unchanged
> > values, and keep the old names as deprecated aliases so that the
> > existing users are not affected.
> > 
> > No functional change.
> > 
> > Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> You acked the other dt-binding patches in this series. Can you take a
> look at this patch as well?
> 
> The other clock patches look good to me.

Gentle ping to take a look at the last patch in this series please.

Thanks,
Brian

