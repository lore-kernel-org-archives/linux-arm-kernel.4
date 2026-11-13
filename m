Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE18606C25A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mIA2xfMT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmBR3YSE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=; b=mIA2xfMT4UtItP
	BTdEB6mjNpkE+5pP+/WJpJMA5zNVxFbtAjLsYjuqlN4TlfhEFYUbhGS4f/Qx2mK3/iW7ZWjMocHhp
	Z0VurJM7FWhUfz0SsjTt+XT6sjJB8mBbK15eA63+yuxQxxQFyLsqY4bTDpQUsd1lR3XhPS+IrpaID
	dxoDJxKEAdLgp2t1O9VBsmEN/Kq1wjXq8CsR1l0ZV9Mr2bCUaQI5FoLfTAs513qM8nGEYeoA9Kafo
	gzwIUMPwY7f5ujoBLTDHmU3H5p8kJ4qs//zTf9CQt6xVyATZA1use8U5kxM2hGhnA1gIOvB2hKHwf
	ethsREz9Q4ZhN4jzUJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGf-0000000BKf6-0532;
	Fri, 13 Nov 2026 00:35:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGa-0000000BKbr-0ifG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:35:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-491aaed7565so134976f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530142; x=1795134942; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=;
        b=dmBR3YSEYUFz/fB7E9FDizdTvSuyqQ2UmeQ7f1UpTXWoW4AYodbuPcBh7/3B0ycCqy
         osxH8APBp8Ew2l8TRW7Z2YrMz0JmAtd/CR110VAxTLVegtnb8fJGEEGC09Gryg9Iiqfr
         B9l5WmIbJkhiZwBwebdcKG/mNqURt37bODeEE7Q6kVJZs6w+yIMgvOuFkH/KAhzskZ5V
         aaY1M1TZ8KdVq51E8r4vY45JGWObyzCGbczeZbs6BN5kATeGr7ZGkTqExKjr+OVLDoVY
         +cMGh5y5wDiUwhJM0sVEZd/gfTAiXwOy/v/41UbSywnvFpS0ZZVqaU+T5AxRXGBKzOu+
         tv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530142; x=1795134942;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=;
        b=OSmvP31853WysCCAcxa2WN0kUUE0yAFBqCu6jjb01QAoCjXGDLu62cxZTbg8WoHu7q
         ENCBJYLxd1jP0ojBP31GCF5CV0c/s2CJpm6EeCk7lZN5NO+zk3nBLpS69dRMjUFBjjAH
         LJIFJzqXGxmjfqu/Zc//HaRcj/qKCoWPpOXa80V0DOUPNEdTLIQfae8IXbm0LxY7igXt
         +ECJXgViT2PEbO8PTOiEWDO4sLNSQElgIzINPWf8jvEtNX6Egtko2Wa425K7RZSjki/8
         iOP6OQApNU/wrsEdvcJxwhBaxmSxk/tiVuPsA5zuzNeFxnhvF+fjbJh0BINjs0GEj9fI
         Mkxg==
X-Gm-Message-State: APuU4Z9moZfqlqL8/uAOXRxh01edbyjE3GhU/1V2jOa6JU9U5XromCaH
	msj+FerOFVDDwTPARCwt+oc2eHKd9NoIGLxXR98bm5n+L1YupoBwRlGc
X-Gm-Gg: AYBFou3Sy9hGNlLLr8HU92PoMK07MlgggPVTIV2cibtyGK202bfi0NArCwv72+CDg4/
	tgaJTBnPSDqEjTrWzvRiczC7BHjKa2mf3U1BzgtMvx6D6q+Cp3a4sJ0lRa+ZxVdLMKqecWk0T0b
	/Od/vaMAvz/n2rVkKj3o+guHrmkj9Ky7/uTBPt8gbYLAuoN1uTsYAE4b+pRpy8kOi9bg6PLPSNs
	zlptI8pN5+TBMUtq1cUIGo8w+yoEp9aSsEGgVpjNAUu3c/b/VHRE4P1UYDb3g6aOvynm6TR0Q5L
	K7wP5wc+hNXh9IEkg31V8+Ik5ou3BPWpY1evIyBu99BPImE4clhSS1sCy/Hi7MoRUUyzOXP71NU
	9NCsZh1/wvlFIl1WodCY4D2oz3HmmpTvUTQOB/9UqlpF3+cH2t7smZiViIvNGfcvYUhDqJ2drTz
	JoObAbtO2tnIwRVhX5Y/PqDDeVe7gREY/DojkThXsf7YmD9YMK2HBBSkK4FwY+9zhQUcYJGDcXS
	b98s2Ixq3lYw/Srfz0qD/FCGWGiIvDulv6WrguKq5EGFv5in2+WIhYBrVdCSYRmJWy/6SWXjEZo
	wSJ+xmZPcQ2TMNmibXCie516I8/3CYFJO8an/HcOexDHuCWDC0O6WTHnwmb8B36ctc0rgA1sA6Y
	h+UXHpEoihCQuYl0Xq6n7WaD7QFC9F12cq3s8zrQEkgbecvFdRMTFBlvFZdpqV0nW4ZEfbxIHJ5
	62QrKgDQbaXISaktBp
X-Received: by 2002:a5d:6f05:0:b0:48e:d27:bef2 with SMTP id ffacd0b85a97d-49c723fc07dmr1853264f8f.21.1794530142217;
        Thu, 12 Nov 2026 16:35:42 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm2251812f8f.45.2026.11.12.16.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:41 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Fri, 13 Nov 2026 00:35:40 +0000
Message-ID: <20261113003540.3660753-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-5-ghahramani.navid@gmail.com> <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163544_233070_0600205D 
X-CRM114-Status: GOOD (  16.39  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefan,

Stefan Dösinger wrote:
> This would be easier to review if it were split in 3 patches, one yaml per
> patch.

The next version will have one binding per patch.

> Afaiu this makes "syscon" optional. Why do you need syscon? Why might you not
> need syscon?

It turned out I don't need it, so I dropped syscon from crm2 in my
tree. All I have found in crm2 so far are the PCIe clock gates and
resets.

> I think you should be the maintainer alone here, I don't have the hardware to
> do proper testing of patches.

OK, I will be the only maintainer there.

> I think splitting those into different bindings is still a viable choice.

The next version will have separate bindings for lsp0crpm and
lsp1crpm.

> You can drop the phy child node and just add "#phy-cells=1".

Will do. topcrm gets #phy-cells = <1> and no PHY child nodes, and once
topcrm is an MFD the PHY driver will use device_set_of_node_from_dev()
like you described.

> I'd suggest to rename clock/zte,zx279128s-crm.h to clock/zte,zx279128s-clk.h.

Will do.

> Do they all need to be exported? You only need those that will be used for a
> clock = <&topcrm ZX279128S_TOP_SOMETHING> handle.

No. The next version will only export the clocks that device tree nodes
use, mostly gates, and the PLLs stay inside the driver.

You also asked on the RFC whether lsp0crpm really has no resets. I have
not tested that yet. I will try your method on the router, clearing the
bits, seeing what breaks and then checking whether the device kept its
state, and I will reply with what I find.

Best regards,
Navid

