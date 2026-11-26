Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72717606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BIjGOHU6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2i7LgE2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/hgw7tjKpgv1YJDPyvW4tYdNQTPf9bMIu7JnD7fWCjA=; b=BIjGOHU6h0phmX
	uf0+GnRFF040Xxfi1Z8YdVRcUX2Pteb7L8FlSNm7ePLrVGyLXbOHT56DfN1bNKqZMYFBVKP/CHXOQ
	e1JXQKr5GBLUX9G8eamroqIkQYtnmq+GzLd9bcZ0pH+aaHRALH/7S3j4Gwtcg1EVi/4w7F6bxrsXw
	5g2mGSOCv+7vWbZNlQgP9JTLryVsJnn2xmiCwptpny4RKPXkT9djQKUTOX6W/jgVvuZ+U+98TmEcD
	BHdEwUSSt5GVQybtg85iVEcBTaniiFbJxz/Nm3RwVTCAXFt79TjGf5wB0O2Guz65Aj6Az3ue0zIuo
	CyKkksdQR06hncBzBv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTuP-0000000CIGU-1Bb5;
	Thu, 26 Nov 2026 07:28:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTuN-0000000CIGJ-3Rdl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:28:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 404FE413BE;
	Thu, 26 Nov 2026 07:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391831F000CA;
	Thu, 26 Nov 2026 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795678122;
	bh=/hgw7tjKpgv1YJDPyvW4tYdNQTPf9bMIu7JnD7fWCjA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q2i7LgE20zc81PKTDp1D9IwqFFIW6OSd23jMOGREKM+Zi3IVA8PsEG/QSCDMpPBfG
	 RrH5Kkr8sx0WPrEa26g01mHiUQl/2nIE7iTxkhCNLvaXfgbk2vTzXFlqVghn4tWKTF
	 g7ySACqclAhNttxpYD/VaQzK2++nVqR6qA+6sdkPMPX95cBb+ViUUbRqDio//0RQv6
	 tThbWdSVwjr32KuT/xGQ5D88SG2rpbXimpyAxbL8JdPC1Ix/W+GrGjjCY9c1X2jz2K
	 kBw1eUaPX2QHMhXAa6spoLsM+DRP+CZnClV2m/13pDyTGZ3XzGZxQUhHqfxjxT51He
	 tVBUXd3JBsOHQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org
In-Reply-To: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
Subject: Re: [PATCH v2 0/2] Add support for Samsung Galaxy Note8 (SM-N950N)
Message-Id: <179567811849.20062.4408545807765392596.b4-ty@b4>
Date: Thu, 26 Nov 2026 08:28:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 18 Nov 2026 15:42:58 +0700, Trần Trung Nhân wrote:
> Add support for Samsung Galaxy Note8 (SM-N950N)
> 
> Hi,
> 
> This series adds initial support for the Samsung Galaxy Note8
> (SM-N950N), codenamed greatlte. It uses the same Exynos 8895 SoC as the
> Galaxy S8 (dreamlte), which is already supported.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: Document greatlte board binding
      https://git.kernel.org/krzk/linux/c/ee06453ba8b860816e9061d53cf6a6427a247df6
[2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy Note8
      https://git.kernel.org/krzk/linux/c/e59848c714e58153671eca08c85a9bed09fb4b48

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


