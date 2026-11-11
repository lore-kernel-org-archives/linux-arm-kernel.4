Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901FE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wh2jkAV+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjpTvGb/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/TGkmkl5EXAQoGi2DbHL8eyxYqMYYgybSMdpzQ49ATc=; b=Wh2jkAV+2HE/JZGwJ6Vqw792nv
	BuxRExoOTpdKDpBjS5jx39xPDsVQDySp704PrlFVEfTmIfCx4gEmrL0eu30pvNRFyMIf4uLXhweQ7
	z+x8ZhF4GK5nq039xR+4S4zDXdYOoKRYKu1ZRVBBV3b4KA0YirFn/XpDFpjKl5GoK0/D2YsZ1UPXu
	l02mwgUwNy48daOlLeXn2ZFfot549FxOIr481OjAPYL5njZ1WdapXUUItzhH9AAIlTIPTS7JblL2P
	9diMdcVW35twifYudR4F6uDNwRaoJYQpB0NoxPN2tqk77orFP/buUr/FMbe2pI3AxdeR4L6sfmp5Q
	eTVWofoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyBQ-00000005SvC-2AGu;
	Wed, 11 Nov 2026 02:35:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyBP-00000005Suo-02qv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:35:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07C8161D08
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AB71F00A0B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794364529;
	bh=/TGkmkl5EXAQoGi2DbHL8eyxYqMYYgybSMdpzQ49ATc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=KjpTvGb/4X9mKEH810dOhhaUHOo5iLr8WVxnxqmWYRpJuVVJU2ofYZVL93GJ5cgju
	 saSlTXA5okLlbwFk3Vx248sug+H1celxydL/n8VJ3zCmI6R1kESsERdAVMYN6P9/cq
	 im7CyIwzgDfu/3dZnhOlNWeBR6DVpOANkbo4m+ePKATjzCXWAgUTKachbkzbU/+OoL
	 bOrf4m24aoleTvqhKcsuJRDPbarAzEIKLzm3bkPj3ljzAtlxdUz/fvkF2Qdl3Tikb4
	 wHT23gf6FnFbm94HxmTH1LKmXDLJZvs0qMgaqrT6K+hY5Od4/rNrPoCp/NCo+/U/bZ
	 YjnjAbs9w8euA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so23526691fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:35:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFznzaA0B7uQO3DUZk/aqt0qUJlmN8bZszyPGxL1lAW9aKc592o0d5ZKUKpRQU4Dj3aCvybAweKOdVaxFeokD04@lists.infradead.org
X-Gm-Message-State: APuU4Z/D/ej/G3pjfQaTogJRpLSvVTYF5RvJfQnyBbDSZsCfuksysKM6
	3/7WiKgkXBIarsb6HC72zgoQ1bJ0oDO32hIL+k/iCQJ+C75FL+3UlEFpmgQYt99Y51yNSviybP0
	nsBPFD9YB/0XR6mVd72huOkALltQD3L8=
X-Received: by 2002:a2e:bc03:0:b0:3a9:9a60:2c47 with SMTP id
 38308e7fff4ca-3ae126ed0f1mr1190701fa.29.1794364528033; Tue, 10 Nov 2026
 18:35:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com> <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com>
In-Reply-To: <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Nov 2026 11:35:15 +0900
X-Gmail-Original-Message-ID: <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
X-Gm-Features: AclHuK9N0O7U9-W_pxCYXlT-RQ5jch4QkX4b2hO5JJ4vf-cajfPSp8p0sSn_nO4
Message-ID: <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: aiyengar1990@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 4:20=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The USB 2.0 lines and the SuperSpeed lanes of a USB 3 connector don't
> always reach the same host controller. On the Rockchip RK3588, the
> SuperSpeed-only USB 3.0 host 2 (xHCI) is paired on the board with one
> of the separate USB 2.0 hosts (EHCI/OHCI). Only the device tree knows
> which EHCI root hub port shares a connector with which SuperSpeed port.
>
> The USB core already reads a hub's OF graph, with one graph port per
> downstream port, and uses it for the port connect type. Allow the same
> "ports" node on EHCI controllers, so that a root hub port can be linked
> to its usb-connector node.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 13 +++++++++++=
++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ehci.yaml
> index 908b02d9175e..9dcba539d60d 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -160,6 +160,19 @@ properties:
>        - host
>        - otg
>
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      The root hub's downstream facing ports, linked to the connectors t=
hey
> +      are wired to. Needed when a connector's SuperSpeed lanes go to a
> +      different host controller, which then pairs with the root hub port
> +      through the connector.
> +
> +    patternProperties:
> +      "^port@[1-9a-f][0-9a-f]*$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Root hub port, numbered from 1.
> +

Would this patch covering all HCDs be better?

https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/

Also see Rob's comment about covering the port numbers.

ChenYu

>  required:
>    - compatible
>    - reg
>
> --
> 2.55.0
>
>
>

