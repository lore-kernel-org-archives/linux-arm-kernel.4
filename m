Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206C4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 03:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S3BQEtkd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=NxiCE+6y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TpD4Qm/8zgFf7AXrcg7HkBUl+/qWD0ZfHjTxcOeCSqY=; b=S3BQEtkdFqX/W+
	Wx9fmq0I/HFSHyMvH+XMmY/d+Q915NhI9q/+oxh9xMry4i2xEasMa5nI5J2d511qksSrA5JYad7xJ
	GEXDpRMFHFXj+mPHt16fWTaEYcMjD8fCm4om5iN61JoxQggysHv6Sgp4MNBZt0Gj/tqEEXkqsPUGK
	ORqUIUJoAznKN5XasPPAnuzKgcQhz7k79hkjLYg7nEraY9SU0sWlSwVQsTo0TMOgpORpG5RaHYO8n
	6IaG49cDwNAtelNMrY7NCrody6vbB+kp8F/YaN7TQStH5wLirraWNxkp9PRMcl8NQ9uiYZ8qALU4r
	FYdByOIOL+O5YODPuJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQG2S-0000000HBws-1etL;
	Mon, 09 Nov 2026 03:27:20 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQG2P-0000000HBva-0WQO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 03:27:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794194827; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FUu2k3l16OUWOAD4erVCXqWmWp0ZbO7uL6E9N9cxh/0G+nIHi37Smp7jFkEgO15xvi3MfBlYj/Wt28RwGlKW9uhcZ4dEe3d3OsAl5aI9PSHFs2GOcfm2Sly81rvNwTnmmi01HV9mEgwHOAhj91VjrOZXzH2ARsGkeJtVW99rUhs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794194827; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TpD4Qm/8zgFf7AXrcg7HkBUl+/qWD0ZfHjTxcOeCSqY=; 
	b=lcvaIHG27YaH56p5ryrNyrFFIHCDvrAj1SEEnD0cFR84fu6WBRPI670Hlhex6904kTUn9w/TEVXrCkQmAJjiN4P5yOd48dxwZmsgx+gxSVwLG7UYkydb/jlIq8ZFf9OIFCXXchgXeczFm6TZYmDeh8t+hPZKLtM5RCzhCt8iuTQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=NxiCE+6yfbr4oEFyZobyLdCcJ1q0wNqxmj65j3ziHU2e3kwtsEVwGnOUzKoTSks6zPfYmfWBbY5yOMbX/AEK9nxCE22ZY14yWRGOaQZWGBzFNvWk4N6JH4O+a07bHyp8P8NW1sSNJN20LDQ4+9apCfeq5CdjxCvzsadx7bE2mPw=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=TpD4Qm/8zgFf7AXrcg7HkBUl+/qWD0ZfHjTxcOeCSqY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794194826003917.809001112961;
	Sun, 8 Nov 2026 19:27:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 11:27:00 +0800
Message-Id: <DMQCZDVK4SR9.1TARE71NCL8T8@pigmoral.tech>
Cc: "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney+clk@redhat.com>,
 "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Andre Przywara"
 <andre.przywara@arm.com>, "Enzo Adriano" <enzo.adriano.code@gmail.com>,
 <linux-clk@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Vinicius Pedrosa" <vinicius.eduardo.pedrosa@gmail.com>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
 <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
 <20261028180913.2829389-1-vinicius.eduardo.pedrosa@gmail.com>
In-Reply-To: <20261028180913.2829389-1-vinicius.eduardo.pedrosa@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_192717_543613_1000E886 
X-CRM114-Status: GOOD (  14.97  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vinicius,

Thanks for reviewing and testing this.

On Thu Oct 29, 2026 at 2:09 AM CST, Vinicius Pedrosa wrote:
> Hi Junhui,
>
> In patch 6/8, usb2-u2-ref is declared as a plain mux, but the manual
> has a gate at bit 31 of 0x1348, and its reset value is 0. So the CCU
> driver can't enable it.
>
> -static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_pare=
nts, 0x1348, 24, 3, 0);
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(usb2_u2_ref_clk, "usb2-u2-ref", usb0=
1_ref_parents,
> +                                    0x1348, 24, 3, BIT(31), 0);

I'll add the missing gates to both usb01_ref_clk and usb2_u2_ref_clk
in the next version.

>
> I hit this on my Cubie A7Z with a USB stick on the DWC3 port (the DT
> and the USB2 PHY driver for that port are local, not posted):
>
> - v6 as posted: 0x02003348 stays 0 and the DWC3 soft reset times out
>   (-110), 4/4 boots, one of them cold.
> - same kernel, only bit 31 set from U-Boot: the host works, 3/3.
> - with the change above: works, 3/3.
>
> Same DTB and initramfs in every run. The SerDes gates were also the
> same, so I haven't checked whether they matter on their own.
>
> My boot chain (U-Boot SPL, TF-A, U-Boot) leaves bit 31 clear. I don't
> know what the vendor one does.
>
> Thanks,
> Vinicius

--=20
Best regards,
Junhui Liu

