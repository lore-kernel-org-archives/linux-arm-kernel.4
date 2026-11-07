Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC0606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xypaGwr9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Me/gCXvJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ytl/23dencL1Kjh9JLygxJpOYoOZT3gKsICQUgciBFk=; b=xypaGwr9fXHnJv
	ZOYKvfCCWdKsOCnrJIqZRAccDqUu3SlHh80rPIQ0xyhguiPN0ZCoaLtmDDbp4kId1FbL2gNctlX47
	bAALGh6Mv0OMGEiU6pNIfd879msio48IC9q6rSkYMJvrmA42veEwmnhf6LxFesfrqmAlmfEEmDzjq
	WbiOgFw3s6YOKtpjWMQmEH6nBGz/cTvaJwsyPxR8bjbIEN7iCYWNZ5KhwMWJ7Z6O0eeJi4pvrUybL
	Zir6lAxGJUD8Ji8ItkMI7IeyFAzmzO/7IjYrSeLIkL+uTsgpzVjSrgZbL2bMkKJIi7WpacM1t+SFE
	dRJSn6EK2cBRGyDnGF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPngI-0000000FQDr-2Evp;
	Sat, 07 Nov 2026 21:10:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPngG-0000000FQDl-2Enw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 21:10:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CF14611F4;
	Sat,  7 Nov 2026 21:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEAC1F0089F;
	Sat,  7 Nov 2026 21:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794085830;
	bh=ytl/23dencL1Kjh9JLygxJpOYoOZT3gKsICQUgciBFk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Me/gCXvJupNPxDpMoeUd9lZVfdbXNEpLuQCr+IrxQ8JIZ6WeVdowPbwjTTlz4yooH
	 VRbOllPF5DawZM93iZvi2oq2CzBhVcrXwb/OcUU0j4H7VQYjj78DuEVrqA+pDrPuTI
	 B9KXYI6jr/KNBYA5PoUSsNC86H1LlYoAWhAM/inqhQVHPZ1fpmqg1Z5c2xHw6qF2Ux
	 cyYdtdEbc0hwno/6eeTuZEY1eKRHeNgfKQTg7Zz1omEuTGPOqoE4DG1E3mGfE/J9Iw
	 B7wPbNciEXtcnaOu8eD+W5HGEKCdRSDQAeo0QTsZwtueR25q2dCKLgIt9SMzSgyZU3
	 E+j0pIPZ+Q5fw==
Date: Sat, 7 Nov 2026 21:10:21 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cwweng@nuvoton.com
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Message-ID: <20261107211021.418a931c@jic23-hlaptop>
In-Reply-To: <20261104091136.151269-2-cwweng.linux@gmail.com>
References: <20261104091136.151269-1-cwweng.linux@gmail.com>
	<20261104091136.151269-2-cwweng.linux@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed,  4 Nov 2026 17:11:35 +0800
Chi-Wen Weng <cwweng.linux@gmail.com> wrote:

> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Add a binding for the Enhanced Analog-to-Digital Converter found on
> Nuvoton MA35D1 SoCs.
> 
> The controller has eight external analog inputs. They can be used as
> single-ended inputs or as the four fixed differential pairs 0-4, 1-5,
> 2-6 and 3-7.
> 
> Use the common ADC channel properties to describe the physical input
> independently of the logical channel index.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
A couple of really trivial things inline.

Thanks,

Jonathan

> ---
>  .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> new file mode 100644
> index 000000000000..85b0feac0236
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
> +
> +maintainers:
> +  - Chi-Wen Weng <cwweng@nuvoton.com>
> +
> +description: |

Similar to below. I think this is overconstraining the formatting.

> +  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
> +  12-bit successive approximation converter with eight external analog
> +  inputs and one internally connected VBAT input.
> +
> +  The external inputs can be used as eight single-ended channels or as
> +  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
> +  connected VBAT input is not described by a channel child node.
> +
> +  The controller provides four interrupt outputs, ADINT0 through ADINT3.

> +patternProperties:
> +  '^channel@[0-7]$':
> +    type: object
> +    $ref: /schemas/iio/adc/adc.yaml#
> +    description: |

IIRC > instead of | is appropriate here. You want to maintain paragraphs but
otherwise allow rewraapping.

> +      External EADC channel description. The reg property identifies the
> +      logical IIO channel index.
> +
> +      A single-ended channel may use single-channel to select an external
> +      analog input independently of reg. If single-channel and diff-channels
> +      are both absent, the external analog input is selected by reg.
> +
> +      A differential channel uses diff-channels to select one of the fixed
> +      hardware input pairs: 0-4, 1-5, 2-6 or 3-7. Each single-ended input
> +      and each differential input pair may be described at most once.
> +
>
> +...


