Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D301606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=po+Uwdi0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1SjANHJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=47lVK3cOyaNIyjPMt8H8DbVBV5H9SqcaWOsJ4QNlPsY=; b=po+Uwdi00mw8XjuOz3cxAEbTmZ
	galZZelrzDkJ/wsI0Sj/Ki/of8esHcUmD9Q5NeCaYqUkQRtY6tpJ0zGI2WoQ3/0qcU4krMRCHG3iA
	mOHPHjM+ZwGh6faEEuECOPC459pON6W+smLdvb6i0/t0uB+7+bcZ3dvsjLMwkmnAqCG3TEWThPPII
	XYWnfS1CqeRsBKiQyaa1PyoSqBFr6oPFvpmwjtXkTVj4Fl0baZBDhS48TZWH16Fw/LH5velhVbrTD
	e4UWv6quXAKgI/u1AKkcFG83OKS0eRiWINJfP3yqZYatJGVHH8aYDxHW6gTT57DvbORUIW6lWU4fZ
	opcRn2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7Qp-00000006fnZ-2Dx1;
	Wed, 11 Nov 2026 12:28:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7Qn-00000006fmx-3PPH;
	Wed, 11 Nov 2026 12:28:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED3DC60DA1;
	Wed, 11 Nov 2026 12:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3CC1F00A05;
	Wed, 11 Nov 2026 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794400080;
	bh=47lVK3cOyaNIyjPMt8H8DbVBV5H9SqcaWOsJ4QNlPsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m1SjANHJ+Mi0oTsBGnxlg+2Ju1lu+wi4uIGVlaj1AE6czkPKkPgH0Qw8GWoTSmK5/
	 EJ24qp/39mVkPX2kxa/5u0xlDAWUZ4teFxX/BhT5Y67VvkTjwUQ5MBzLMUdNXoQHty
	 yjLB9lMTLQpqvBiK22zy8FuBoRhl+Efkbfrl5KYqaYUf/mp3e9i3QHjm/b2sgBfAef
	 2lybkqHwVj34L9dRmib3HUbxkThkoH2lyeq1IFfZ4REjUcFp+HcSFBKNBA0A668db0
	 gxh80Fw7BcAo/lLMJVXwVPCY2ohzXlW6dCbay/xl13qWd6Cz/C7TSltq6XnAf+6zDX
	 ZBrwmTtoihG8g==
Date: Wed, 11 Nov 2026 13:27:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4
 support
Message-ID: <20261111-beryl-fossa-of-excitement-eff7eb@quoll>
References: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 11:46:32AM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The S4 USB glue is the G12A one, but it fronts an xHCI host controller
> instead of a DWC3 core, with two USB2 PHYs and no USB3 PHY. Add an S4
> compatible with the G12A one as fallback, and allow a generic xHCI
> child node.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


