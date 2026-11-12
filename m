Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD720606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d24ItzUO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PH4ZdQp1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=; b=d24ItzUOqwdHTd
	4yy+2tw1CKtj8B7gGO4pXC460c8IfPjpHV+y7hEjy1JrIfzxSvNIlZH1EK0e9La38lbnsQiLZPjFq
	LJDiteKj0map+M5zyc8AznAqihXCt2An/HXGFjh5Jy0CFZQpNuudWD/Kk71iabCepJsxuGj1QQ8G6
	xQ+tgiO3YK9rR/loh3mADgGGm8QAxhVLLpBuEud0jX8S5GlDFMlWcFyd5GSFF3vZDuBvrzOZcKHnm
	Li2UkuJgbvW9sB/s5fFKJNYZHDvqBYGlAQA3Biz/PBpdDlMTeyR7X8mzve7sMl+Ubm31MQ5RfvADc
	q56Gh68jJuZVWfeNySAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPjg-000000090TH-2G9K;
	Thu, 12 Nov 2026 08:00:52 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPj8-000000090Mn-3rmB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 08:00:24 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3ab30d04674so2045161fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 00:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470406; cv=none;
        d=google.com; s=arc-20260327;
        b=IVEV3iK7VgZRIs//Ea5HOyOABTiifsf0mmV4KIO200LaIJvelXypg///VuxVzqF4HK
         VcXI/LAeESjI5go6pdcfi4xKhwf1sidH9W4ngalz7jXCewa6h8qKEFqbHQ8T3SSaSF1p
         q3ijNk4Ob8ajcQMhHxBLdNzB+IxJ107B2yZHvVHnl+7G1eRDmn0itgDUIZekXrMmwBGK
         6sTBxhVmB5ifLT5O/nBtpPzaHfzKN6ChyYBNgy62y+Zt8ZTQq5v1/kKhXpBMgH3iQjor
         XHBjuWj6HstqX73zknbns3AwbUbyc3r4K9ACYWgE6nzLlh/d5Q6B6BEj0M3hyu/UvvHK
         ClPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        fh=ST8eOdRFGhuvr2+O8u00jkxmwYxu/3bNzkO1ru8QTj0=;
        b=eylKryzVk2TV2LldbHWSuESNd3IIQ7czyolno0Nglk4hsFgszEvD/u679roYKEb8OV
         AHRZ+Kl6XwAmzoqhpTD2J2PF+qo6KIQ0rHICF2P1VhOsM4ojgwlMP77bVUTH8ujTsGVe
         OpvXad1ZDr7bUgyZ+aw4NF/9nTbJgQONNuGHMAZ1h1ta6XiebvURO6NSewy7oI11RT6x
         MS13ab02r1kHDWA6AxX3PJ45Ca7+szVe/Xfd3mEjG4+OjcYt576JDM15YxTDtfkaLaJ2
         fXFssGg9Ha1OtRTUleIK5EfN+fzB7B4IwEL+dnUx+jPd0ic38IDnXeOBGVDtmDEesWyD
         AKAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470406; x=1795075206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        b=PH4ZdQp1A6vMrPhe1NlVhImw486VM/dBbSGsFp8uB7M+10If5yYNtIgCWIe2F8Pdba
         7DU9rAB6aaV1fkm2d7+0kzd6A6Nazbo9e8mS2497Q1E3Yq+RCnedB0m9M3+YaX2RqUIN
         odpid55/OflzarXMldclv4ToXxD53ibCm+lLD079r4mIjGviDubgvwYCMx1/It2Pbsmb
         +EyUmXRiTOPB0GLmloc0m7/qKjp9anVp2+TWOKSFWoLtkSsP9PpY8AB4IZ2BsYhS1WSV
         Q4jC0cp6DGp7KSYwSB+ge1i8Uvlhdvs7jiSnVi8NxDDhT8nNFp7+NdiYJdIjpjHZPUVz
         9BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470406; x=1795075206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        b=D/brS3j1LVciutlpsPnU6gPnEYf7l1ktx2lW3vfR7vC8USdwhcVuVvVcVBTBUYPgIF
         tGRiv9XT0vFY83hXeyFsESD2DZdRC84yMCcKvov5uwj82EzEBlg/1JINNnR+GtXfltxo
         yEnCH8ojcgRQFAaSEOZQ/E/fXUg8agJLHIk1OQOp4C5YnVgF3gO5c+lwM+53prI8xNRS
         e4OhS7OVq9C/lJoBxgm7MZ9cJblq6nKryocv+7JfYprEZQ51vhEeQKbTduY3+bG02F4L
         VcY6WRmrlBLW+a1Lpq6f7zobBjfMF8g6C3qboHG9E/Eq7iJfSaa3xcfzPhfJmb4XZaob
         vczg==
X-Forwarded-Encrypted: i=1; AL+hErGyXVCkqUymjrWYNuXxmziI6t5XFBCk7KCSAWAYHqjQHo244zuUIT4GrD0nSOoX8FkCDC/65FZ2PK2Hp/FWRRiZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9PwMi+V0qFwrTX1XK0sjy2H5BT3CH/OBw3S87N2Pvegc3h1bbB
	xnypBzE5iUYnLWlnoTx/9KTcYijxWWt62KE9nyNZMRpp7ImzvVtZgwa9BCs2rXaqxm8E3NSeVu2
	IhtAMZKJfHutv2NDKeVBOuL+qGzNdmvY=
X-Gm-Gg: AYBFou07667GFwZtuIq16BnGYNdyyYspbDsrnxAkQCbHOVFiGdy0P8zxC/FdTzghKwY
	zUI0sz9zCKNmB7AVx7bZ9vG/58ecouqzs+3tIaEOOSR+NxwrELt8GJ4LtbwLB0nuKbPhCyP9zEZ
	cvkuIa7U1oU9em52mBX9eQZBS/nF/fnw7e3A+5xI8apJ5gVtO9KR3ghPMNzn2nw7NRzLor+z9Ed
	MMrsOCe+3eyvoJ6iUFn8FY2flQcBL/okr8g07f/nz1k7CUbq0eRV1x836PED5wY85alObxO0z3W
	5quwcD7Tss5gw9pte9MEcZBg21F69M4v20XXZ4TE5sy4syIy8uCfnvv/6YoWZAABewy+VhczOGG
	2omuva+C48PnIMup9mHVL3Ie9oVgfM73ryBjlSVEE379fnwE/xyY/gRncuKWiqJ+tf44wtmw=
X-Received: by 2002:a05:6512:32ce:b0:5bf:d00a:b6c0 with SMTP id
 2adb3069b0e04-5c15d61a7d2mr1922231e87.3.1794470406245; Thu, 12 Nov 2026
 00:00:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com> <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
In-Reply-To: <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Wed, 11 Nov 2026 23:59:55 -0800
X-Gm-Features: AclHuK-RZu7t5oXW3B0hgGonN3UAbxzfPc39DI6ekhiu8UyR_6arhmtUrw5yX_k
Message-ID: <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: wens@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_000013_241748_65D46E0B 
X-CRM114-Status: GOOD (  26.68  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chen-Yu,

On Wed, Nov 11, 2026 at 02:35 UTC, Chen-Yu Tsai wrote:
> Would this patch covering all HCDs be better?
>
> https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/
>
> Also see Rob's comment about covering the port numbers.

Yes, yours is better: it covers every host controller, and
generic-ehci.yaml gets it through usb-hcd.yaml. Rob's point about the
port numbers applies to my patch too.

v2 drops this patch and builds on your patch 1 instead. Only the
Orange Pi 5/5B DT patch, which now goes to the Rockchip tree on its
own, needs it; that DT passes dtbs_check with your patch applied, and
also with 'reg' limited to 1 and up as Rob suggested.

The v2 cover has one question for you: patch 1 there looks the graph
ports up by root hub port number, while you have said root hub graph
ports should use the raw xHCI port number. Which one do you want?

Thanks,
Arun

On Tue, Nov 10, 2026 at 6:35=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Tue, Nov 10, 2026 at 4:20=E2=80=AFPM Arun Iyengar via B4 Relay
> <devnull+aiyengar1990.gmail.com@kernel.org> wrote:
> >
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > The USB 2.0 lines and the SuperSpeed lanes of a USB 3 connector don't
> > always reach the same host controller. On the Rockchip RK3588, the
> > SuperSpeed-only USB 3.0 host 2 (xHCI) is paired on the board with one
> > of the separate USB 2.0 hosts (EHCI/OHCI). Only the device tree knows
> > which EHCI root hub port shares a connector with which SuperSpeed port.
> >
> > The USB core already reads a hub's OF graph, with one graph port per
> > downstream port, and uses it for the port connect type. Allow the same
> > "ports" node on EHCI controllers, so that a root hub port can be linked
> > to its usb-connector node.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 13 +++++++++=
++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/=
Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > index 908b02d9175e..9dcba539d60d 100644
> > --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > @@ -160,6 +160,19 @@ properties:
> >        - host
> >        - otg
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description:
> > +      The root hub's downstream facing ports, linked to the connectors=
 they
> > +      are wired to. Needed when a connector's SuperSpeed lanes go to a
> > +      different host controller, which then pairs with the root hub po=
rt
> > +      through the connector.
> > +
> > +    patternProperties:
> > +      "^port@[1-9a-f][0-9a-f]*$":
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Root hub port, numbered from 1.
> > +
>
> Would this patch covering all HCDs be better?
>
> https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/
>
> Also see Rob's comment about covering the port numbers.
>
> ChenYu
>
> >  required:
> >    - compatible
> >    - reg
> >
> > --
> > 2.55.0
> >
> >
> >

