Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B2A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 22:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3bNKc6wI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZM+kP8bg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RZmkQsegMJj7uMwYkqEnAyJP3f797VptXlgVvu0XiXk=; b=3bNKc6wICgukLDL2INapA8gqKY
	DlkJAVkjvxdZOjT3fi+KwO382yclVG5uko7v3uSm9Fa7mFXKSjN5+qfAao3Kk2mS9wJcgyTyJdRxq
	65W2RdsIe6AFwqRL7OX/gx36KHE/nWQJWWn5SaI7TQumNW/t/Vd/dlUcBGH18UbucIRhE0pRGr9J4
	2Xn8uYvPjB1UXfVxyCQoHMPmZg0Skk45OyskX5xveO4st8ebWj6ac1mXZy5y5pXOZdexwOOkusWwA
	CHyYkm3f1BoiiQSGxgh51ay+KSTh48b2Puv60/qYCmaxJlXKV4bHrLPnrN+N6vjifLM/u/CZtSZyO
	RzvCzjAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdN2-0000000BAxw-0f11;
	Thu, 12 Nov 2026 22:34:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdN0-0000000BAxO-2r77;
	Thu, 12 Nov 2026 22:34:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E9E4F62488;
	Thu, 12 Nov 2026 22:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D0D1F000C9;
	Thu, 12 Nov 2026 22:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522853;
	bh=RZmkQsegMJj7uMwYkqEnAyJP3f797VptXlgVvu0XiXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZM+kP8bg96LTcgRrl2O4tGJEin6FVZ7fV8cdLYYi9RGQjd1Ol44XopCDh7O3rYhgi
	 eYdIxmx6rQwupBV1dD3kXO1s/5tTfFLoR2gAWrjHekiffpv6X21tT/8ec1RLo9NVWX
	 hLgMaP/hzxEc+rRtp+hb8fq2/XYBeW/qDDvuWxVwzohPvW8MSB3PUelUcffzzwhMb/
	 sygPytE9j/V3kEq95ft3hExbLSJDXdN2UL+exfS7DXxiVBhhudY0xwEXQQYY+bu/WA
	 4CkKrv4Ae+GkOmdnhcQAaOTu7xtpRl5rK07scbQvWKp9484/kLciakm28D7Bx4Cmhm
	 Rsz/ThonRFqVw==
Date: Thu, 12 Nov 2026 16:34:11 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: linux-kernel@vger.kernel.org, Joseph Chen <chenjh@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Zhong <zyw@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>, mfd@lists.linux.dev,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mfd: rk8xx: add board level power
 hold GPIOs
Message-ID: <179452285047.1753442.18416322410277903479.robh@kernel.org>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
 <20261101154053.3874-2-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101154053.3874-2-yaozhonguwl@gmail.com>
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


On Sun, 01 Nov 2026 23:40:50 +0800, Yaozhong Li wrote:
> Some boards route "power hold" lines from the SoC into the board's power
> circuitry. Those lines have to be held asserted while the system is
> running and released before the PMIC shutdown request is written,
> otherwise the rails can drop and come back up instead of staying off.
> 
> Add power-hold-gpios to describe those lines and power-hold-delay-ms for
> the settle time. The driver reads them for every RK8xx variant that is
> the system power controller, so define them once, in a schema shared by
> the seven RK8xx bindings, and reference it from each. The bindings
> switch to unevaluatedProperties: false so that the shared properties are
> allowed, except rk817, which keeps additionalProperties: false and lists
> the two properties: it also references dai-common, of which it only
> allows a subset.
> 
> The array is bounded at two entries. Firefly's vendor kernel handles
> exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
> files use one or both of them, with an RK808 and with an RK818.
> 
> The lines are released from the PMIC's power-off path, so they are only
> meaningful when the PMIC is the system power controller. Require that.
> A board adding these lines is expected to switch to the generic
> system-power-controller property at the same time, so the deprecated
> rockchip,system-power-controller spelling is not accepted here.
> 
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
> ---
>  .../bindings/mfd/rockchip,rk801.yaml          |  5 ++-
>  .../bindings/mfd/rockchip,rk805.yaml          |  3 +-
>  .../bindings/mfd/rockchip,rk806.yaml          |  1 +
>  .../bindings/mfd/rockchip,rk808.yaml          |  5 ++-
>  .../bindings/mfd/rockchip,rk816.yaml          |  5 ++-
>  .../bindings/mfd/rockchip,rk817.yaml          |  4 ++
>  .../bindings/mfd/rockchip,rk818.yaml          |  5 ++-
>  .../mfd/rockchip,rk8xx-power-hold.yaml        | 42 +++++++++++++++++++
>  8 files changed, 65 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


