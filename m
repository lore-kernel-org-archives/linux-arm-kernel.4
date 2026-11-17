Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391CA606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bP7ifez+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EeCtp7snYUo/kEjz5Jxk/wAX9V5PpdKoukdWg5ioibg=; b=bP7ifez+Kph34SRAGlr0FjaROG
	nBtm0O0AqoKEmze5ZVRP0smy2u0Z1ZE2R6eGENVBfY1098H3JP1syrq2CUhttslmFb8EiL5ISpfnb
	HQa9IF0ZxEz7/eV5363FDEBZNfC8kWaNeRq2BFSz473lPf8NjA5zhP7HRhM9APWXvW3UzyWYJc7Ob
	J1P0VfG60DmvBbqUMTPHtkCavxdUWEoqBpCBkIUOumx5jdNElGsWEzbnYAgo9qEibhuG5+Fsvdh6j
	C9vJqvVLXSl+j5BIvGhyc/T6MPqDE+o3QGa/aga+wYKnlBLQilvIFPZ7IbFFKuF2MLqNJFJAgaFvJ
	MNztSoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJHm-00000005wuH-13UW;
	Tue, 17 Nov 2026 13:31:46 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJHg-00000005wtA-01JL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:31:44 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so722784e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 05:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922298; x=1795527098;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EeCtp7snYUo/kEjz5Jxk/wAX9V5PpdKoukdWg5ioibg=;
        b=xezgVWepUoQa44od/WFaZQkG7+NgNotaB3OwflNQYlLAcvJ1b4lZWWVkNV4AI76aDe
         FaC7v+X7h8XMb1hGKwmVtsXEvm1Gm2nm6LXbfAHBqcXGsNvGiijgnoqR90Zi1h0wUntI
         su1Te0jTahwXsiMb+gvls3vbzHwWCSUdN+gOeglXdMKUi9tAF/aB/CqW4u9ZwwrLyd4a
         MMZMS5VAeXr9KAe44vkqGK53e3pK2W7Pdf4T5sSVl9QvZKJM2EnhdZwVlq78442OvO+c
         b33ACtexKnnCrY1WXfB6Pl6U+AFdIVZUT2CMJQN1+VzSCuG42hVp7DFC2qEJR+0clMhs
         7dRA==
X-Forwarded-Encrypted: i=1; AL+hErENUWJNoHFkMQxZxQpufpnPjLfuVkbPBIY36oy2TPnhXrjl4ALeP244y4i6ImfMcRFeCXrMzVq55aAqGKXCY47W@lists.infradead.org
X-Gm-Message-State: APuU4Z+NS6+q9UakyArrkd1WdPV7UkrFllAbsi5/XmkXwSQqYjuDqkos
	KDJ+z65dxOt5htBhY+G6xj84BF4Y05BV4yIm3XUJZ/NAc29/tu7obPf7sqigjCRa
X-Gm-Gg: AYBFou0lhb430PwWAiKdv4rxkUKrUCCC3mPP3YUmR5Flcm4t1W+sYWqbaxpymEM4QK0
	V6GQvoq/qMm5B37j9oJapEfOGApWlBq9VjWOM9/PWcpjS3z8vZgL77HceYu3ZuaRTyMdnkyn0aF
	jR4otmcQ+wyC0goXaiLjZwxbbijUfOF2QPXpxNF6w3C0lc++B1vEAdgGWj0+YRlM0Rhen8Bqp4j
	jcN/59oYoYrjheLknimqqO/tfpkE2T3500rOMUJhFJtHpKLL0nvpkAz7kKKVjD3MAyDtWNb5HUu
	G+MEl9PsMTtOmxoKNTNgQDTw3J0aHdvQbxL0EfpduxQxJe7a+KWokn9s6lLaV7iLmUhqUiS5lG6
	/Bp7dlLHExzQnp+ywkuQD9Z1Sbbc4u7UWbLPtjyljc+gvC7H6nto2pDoTP/tITQbzjAL6YgEU9j
	0ZlYcOkXvdHqNfRyuT82kDcGF7q73JT/1qUSypETizov98RcavgREjPhuLAWyet0sd1b8vm/54C
	QZ2dt8JPcMNDBjEej00bzT1P+/+3cTntGqDDcD5uYoYlg/j3+IJwg4AiVhWEMVohU/EsPiWjzog
	ZdJDu+Iscg4NsJ0LULL9jHpeUW4IcD9HBrWBECa1cM3C3tdRpgvX+yOm0KZQFa4nM2dapGQ=
X-Received: by 2002:a05:6102:4247:b0:7c3:83a9:edc5 with SMTP id ada2fe7eead31-7d69f642e8bmr578043137.4.1794922297644;
        Tue, 17 Nov 2026 05:31:37 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e023608sm2412888137.7.2026.11.17.05.31.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:31:37 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so722768e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 05:31:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErENmRKRG3GEaGkuUWXnVMoQyDb7CQrJSfvmorYvIIGa1ftRQUHz7uawNvwouAFbGrRcYq5F3bqkluDoRH50JPMP@lists.infradead.org
X-Received: by 2002:a05:6122:680e:10b0:5e9:54b9:40a with SMTP id
 71dfb90a1353d-5ee5b70f820mr569387e0c.3.1794922296878; Tue, 17 Nov 2026
 05:31:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112204944.1427733-2-oss.patchbox@gmail.com>
In-Reply-To: <20261112204944.1427733-2-oss.patchbox@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 14:31:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKKAVhPZ=473QzM6pQ_3GAhnDte2WSBLj5c+gAni-5xw@mail.gmail.com>
X-Gm-Features: Aa3M54pQZqX6BYtGrH7PmQPQgi-XDFTxO2MIGthzf4F_ODNzK-JgBMe7vBScNM4
Message-ID: <CAMuHMdUKKAVhPZ=473QzM6pQ_3GAhnDte2WSBLj5c+gAni-5xw@mail.gmail.com>
Subject: Re: [PATCH v3] irqchip/gic-v3-its: Drop ITS node reference on
 its_of_probe() errors
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053140_048926_7B19B9DB 
X-CRM114-Status: GOOD (  28.40  )
X-Spam-Score: -1.6 (-)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yuho,

CC devicetree

On Thu, 12 Nov 2026 at 22:47, Yuho Choi <oss.patchbox@gmail.com> wrote:
> its_of_probe() walks the ITS nodes with of_find_matching_node(), which
> drops the reference on the previous node and returns the next one with
> its reference count raised. The loops are balanced when they run to the
> end, but the three error returns (a failed its_reset_one(), a failed
> its_node_init() and a failed its_probe_one()) leave with the current
> node still referenced.
>
> Declare the iterator in each loop with __free(device_node), so that the
> reference is dropped whichever way the loop is left.
>
> Fixes: c733ebb7cb67 ("irqchip/gic-v3-its: Reset each ITS's BASERn register before probe")
> Fixes: 9585a495ac93 ("irqchip/gic-v3-its: Split allocation from initialisation of its_node")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> Acked-by: Marc Zyngier <maz@kernel.org>

Thanks for your patch, which is now commit aab02e49f0b54a08
("irqchip/gic-v3-its: Drop ITS node reference on its_of_probe()
errors") in irqchip/irq/drivers.

> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5572,7 +5572,6 @@ static void its_node_destroy(struct its_node *its)
>
>  static int __init its_of_probe(struct device_node *node)
>  {
> -       struct device_node *np;
>         struct resource res;
>         int err;
>
> @@ -5582,7 +5581,7 @@ static int __init its_of_probe(struct device_node *node)
>          * reset, don't even try to go any further, as this could
>          * result in something even worse.
>          */
> -       for (np = of_find_matching_node(node, its_device_id); np;
> +       for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
>              np = of_find_matching_node(np, its_device_id)) {

So the old code was just an open-coded copy of the existing
for_each_matching_node() helper.
The new code is the open-coded original for a future
for_each_matching_node_scoped() helper?

>                 if (!of_device_is_available(np) ||
>                     !of_property_read_bool(np, "msi-controller") ||
> @@ -5594,7 +5593,7 @@ static int __init its_of_probe(struct device_node *node)
>                         return err;
>         }
>
> -       for (np = of_find_matching_node(node, its_device_id); np;
> +       for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
>              np = of_find_matching_node(np, its_device_id)) {

Likewise.

>                 struct its_node *its;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

