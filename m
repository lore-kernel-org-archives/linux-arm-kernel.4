Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4853606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0NwpEylo;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aP0Rk9Ll
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=riOq4/RI64RYT6I791/FAJUl+Fz8YYsU95UzjkX6Fp8=; b=0NwpEylotyI5wc9vHMqZQ4BGof
	aAqUdKDRL3jDu2/2epgoRLMfOYPMeBgg1/L+I8rGuEG0enF0+DybkZVH5sLJ6Swuj5PWod+8yTjxz
	ufP0b9ES9qMqQqVMKGLXxxZRSmqtbDv3MAPITP/8FqVEhPN+xc8ccD+JZG/FAXTGVEviiDnNE+dyr
	TCHF/Jf57Mv+6E9fxYIj97MHPbUnbhfc1K5u3zE5/sW1DLDCPw9PoaWXuYrUJPg6s8KFZxFos2zVR
	amDKxDJF01V5piKcsXV6+vHhZQ6SpPi1KyDJnKEzz9NOJF07DdN3MKjjsdoGDWe1vWCkOXDxmNiZF
	8HoLekTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdfk-0000000BDA5-3MKv;
	Thu, 12 Nov 2026 22:53:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdfj-0000000BD9s-21hR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 22:53:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EF03605E7;
	Thu, 12 Nov 2026 22:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AD51F000C6;
	Thu, 12 Nov 2026 22:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794524014;
	bh=riOq4/RI64RYT6I791/FAJUl+Fz8YYsU95UzjkX6Fp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aP0Rk9Ll1GcUq9dX/ZnSLaSfSIIjPHTjj8j1g2Z11u62YwyU8t7n+ZedIBZjm4MLq
	 RUMuzfEw3pplAYYjgUyj9I24yLd0unrJCfa7VnXSvKbiy676uPLZPxGksJve0LYOPc
	 HFtfBeVo0t/WhJWwyQHCYVr+qp6EfGT/rKjDUuUJ16Jmk54Q7Cc5Yx82x7vdi9MP2/
	 901pAruII26uSpT7yuEHSiVHH9RPI57zxWob7yBevhddMcL/TYrEMWGfGiiXBG2RUG
	 63yWDcDlS6L0S5F7g/wvfruSMyVwptBqE7aAt25mIvLoFqmlUStsiy257qADJU4tLK
	 9FHbz4IWECJyw==
Date: Thu, 12 Nov 2026 16:53:28 -0600
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Message-ID: <20261112225328.GA1784283-robh@kernel.org>
References: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
 <20261105064117.277495-2-chancel.liu@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105064117.277495-2-chancel.liu@oss.nxp.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 03:41:14PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> The NXP AUD-IO slot represents a physically present I/O connector on
> the base board. It acts as a nexus that exposes a constrained set of
> I/O resources, such as GPIOs, clocks and interrupts, through fixed
> electrical wiring. All actual hardware providers reside on the base
> board. The connector node only defines index-based mappings to those
> providers.
> 
> This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
> where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
> same add-on board can be reused across different base boards that carry
> this connector.
> 
> [1]https://www.nxp.com/part/IMX-AUD-IO

That link is pretty much useless. Is there a pinout definition 
somewhere?

Looking at the overlay, this looks incomplete. It looks like there's I2C 
thru the connector for example. There's also power rails.

The idea with connectors is that overlays apply to the connector node 
and nothing else.

I2C we've kind of figured out with something like this:

connector {
  i2c-parent = <&i2c>;
  i2c {
    ...
  };
};

Regulators is still open issue though.

Rob

