Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EB5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LMKEntD2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BwtDVxcr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ektZNdoDRs4nbYgB95A+evTohYyvZ+c3ZHsun85mrNk=; b=LMKEntD2zDuF4mHldB69USlFxw
	uFFuDgoFfmeIEqmhHqZf6c9qHUsBuArlua15Na+IEuTDwlQT7TAZu009q9RwQOc50ts0tmUQkIOcA
	6/QB9yCYjAbvMsX1FqfPE/9O1f+UdlluKKTMwr806nALrlTG3PiRu3sM1XuqEY2ervEcExrJkL4vT
	tWMJIhEBmVRbYr22frKktkS8a3PvvfE5OiWTjIm5xGdxZnDz0kig6sa5/dV1jbUbHaUZrw/7x8lM8
	C7+pFSv76yQZqbgFM+U9YNFQISVCmLbz5Wffow21M5Xuu27SXM2gBo9bRz7ZQE16946hysw3ssifk
	Gd1jHAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSht-00000009d8g-0Hxz;
	Thu, 12 Nov 2026 11:11:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRShp-00000009d8N-1fPK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:11:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C29E60267;
	Thu, 12 Nov 2026 11:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182F21F00A05;
	Thu, 12 Nov 2026 11:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481859;
	bh=ektZNdoDRs4nbYgB95A+evTohYyvZ+c3ZHsun85mrNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BwtDVxcrJDfKDI+sNi5mUcOqiYck2I0tcD04KbCSmrlsFNsp8iy2H0NSgZfTs6nQL
	 UqhE0LLuBc4NGVQX5rq7sxaVHvir0+MGbNrfZ81U2xeent/FHcvng2rTPmxY4Z5RDL
	 cnDV9KWGV1fef1OllxITvJDrlN2i0eW4mpFyo2Td1oZp9h8ec11zAf0YDaAMcDRxr7
	 cNcG3ZLa5Awm2hhqOabCa0RQEC0Z8TXy4zEZkeXUl8PweS+LCVK+YOorDmkVVOFKIs
	 nZMkj65GTyc+wJwnWv+VPH+/lI1eC3bFtaq0ikhgar2blqlEQ8LXOcRPEDZBWYYNrI
	 c198QFJyWiJ7A==
Date: Thu, 12 Nov 2026 12:10:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Cloutier <vincent.cloutier@icloud.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Purism Kernel Team <kernel@puri.sm>, Vincent Cloutier <vincent@cloutier.co>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add Samsung S5K3L6 image
 sensor
Message-ID: <20261112-dainty-groovy-jaguar-7cdd26@quoll>
References: <20261112004636.739749-1-vincent.cloutier@icloud.com>
 <20261112004636.739749-2-vincent.cloutier@icloud.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112004636.739749-2-vincent.cloutier@icloud.com>
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

On Wed, Nov 11, 2026 at 07:46:34PM -0500, Vincent Cloutier wrote:
> From: Vincent Cloutier <vincent@cloutier.co>
> 
> Add a devicetree binding for the Samsung S5K3L6 13MP raw Bayer image
> sensor.
> 
> Describe the validated two-lane MIPI CSI-2 configuration used by the
> Librem 5 rear camera, including its supplies, input clock, reset GPIO and
> three link frequencies. Require the endpoint and reset GPIO: the driver
> uses hardware reset to stop the sensor if an I2C standby write fails.
> 
> Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
> Assisted-by: OpenCode:GPT-6.1 Sol

Drop tag. Also, your SoB is supposed to be the last one.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> ---
>  .../bindings/media/i2c/samsung,s5k3l6.yaml    | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
> new file mode 100644
> index 000000000000..097593d74780
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3l6.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3l6.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S5K3L6 13MP MIPI CSI-2 image sensor
> +
> +maintainers:
> +  - Vincent Cloutier <vincent@cloutier.co>
> +
> +description: |-

Drop |-


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


