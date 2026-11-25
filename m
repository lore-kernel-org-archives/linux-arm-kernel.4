Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70871606BF4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZkQoVrD1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oOBb+L+p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=; b=ZkQoVrD1uYELU/w6XsQh8qU9YU
	Sd8DDApwps319LHnBxHWU6PaMIGritbiYvUDm6imlj1eH59PKge5OjAJiy1F5ZmgxFZtSXNjWBFg8
	e0I8dYE6Xfj4WuGc8v5XghBSJVl+wJj/DzrNJePrASsXAPPlsRdQoj/aWvZPtouN2nT0leJyppNrP
	T7Kkjxdl7TpDRD4Xo6xCzl3VWfxG+sqhfP3Mkgrzt24St38wCSlVNqEoChJmFd1XzTwInNUIyXd9J
	MdjTzfqyEgH40IMi30GkMNDYivpAiqGsl/YVBFEDa5dVazdZyJUr0Tr43EbV9NuMNuOfnj9Q3iVqH
	iUf+zb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF72-0000000AOji-3bjK;
	Wed, 25 Nov 2026 15:40:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF61-0000000AOGC-0Z9b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:40:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso13424375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621183; x=1796225983; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=;
        b=oOBb+L+pLcyQzwIMuf8/kIQWYp32iQscasrn9iwA/GqFIZsSoHmOmXTYIWXR3i6iNS
         E5yjeMy/kY0iw0CrbvoxqkTeIkVnOPB7AJvjuvoJZxMxo6TAVyYrN9ds5XGgxgOU7M7G
         GHm2ri8l1sgFXC4xRmSzbjKHel/YpIJyDf8oJNIMIkWWFvQ3vV3y9Rmn3CUQKhUI6zNv
         f7rj68Pzx6UU5NtjGVWfhm0F/A0wM2LDwHh/KRzlguAGw0vO3UY4zOXhzucVbk3QbmO/
         WFVJIviKLNxIGLmtgJ9RvmyLk/UK2ZGlrvf/bhQMiPNIk0z4Hh/bJk+iBR1Czjr1dvBv
         lygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621183; x=1796225983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03OK5Wux5qBQjFwf+S+X4PZ6SO+iKxNmDWiFlrnb6so=;
        b=BbJXGFvwxLiQfJH3BUTRJAD1a7PRlec8sFJVDYzqGBeuukWc92cESD+qutgMIJgsvK
         pPC7CkHhu7wD9UZtVyhPki0kPWHwF4FA5cisUPMkONpPdm221M3j1gnCe35QlvudVmUs
         xmFs12MVunAacy5/I2DnRMPxLc+YZufZZ/HSmzeGqYlmd5TNsIXD8xBPH5hK+eGfDnix
         vjOOo8vHz7GMdxIFT4ioAmDaZWzEi0bmZXb54RtJEj10J7isyFM9yhtUgtKV7cLBKe9+
         ukaLn/vELg3XdT3dxQtaO1e8Af6+tHj0/S91E6PtIWUycuV4KVN0/x2PxjPtPyGcWsgX
         36PA==
X-Forwarded-Encrypted: i=1; AL+hErHheYH8/lJhCYD66CNrUyQAHfZH+WFAkbIpHWgJjjUiKCCIL3QKvA1RDFrxcOFI4zoI1t/DUUmfir3b6zKAWgPU@lists.infradead.org
X-Gm-Message-State: APuU4Z8Vlbi5I/uGUDCTi5icueFYsft3y0B9wW/13/gTC4ZS08UtRL6T
	Q/bFp/1dI0ojTHCa3BX4ySuFzx9L6tDOXSuzgyaZT/0k5PF2wYoRZTw+
X-Gm-Gg: AZFdTZf+jJjRP3lPgAnFtFoC8QWLWFANXKkCTiIAEZZJvIXLW9+i3NvUw4zckF3Zkc4
	cXq4qnxbK5xAqn8SLlibjQQVBcIVZ2CfCvtJIQF2uaYSfjTmGGq9aKSXLuoRDPOK3pNLMB8+1g+
	Y4TLKWTYHHegJeIqYY4Mpum/28T5yuJe3cJgzfVsiPd15Fkz+q88iXQumjjk4OwMsQXgGToWE8e
	Hz6o8mZD30FLoY3Z1tGzrJfVRA9102Hn47DN2h3guq2PbYMdHJjb6S1/+r+KqyufMKTbA31Yevf
	46D72vw5tc61+kRq4LngVwum41I2GbasKWLtTHE8ePbaJPd1d7JRr4l8rT3qdR5CIb9bMjUDkt3
	ThA3n1+Oddr9E2moW0WLMlBkvEBhiAuFZ7o9qxJGBWCikYDhkEFHrOJXXgWnK5QnqoNOFIJU3Jm
	kyV7vFJKIlGGoF1VHzlAJb6wfwv6qHNnq9NYuDWaNWp4GX2KxjWOxEs31yky+iXoXDoGcSs2buQ
	tNAuu//N2PyZ+aW+RebgRfrSwTgRrbfEFaks/lpf3IPeaqbKqGIPpJtpdK8thOIMCmwygqdS760
	AyEMAalDusXGiKz4edh5OiftL04=
X-Received: by 2002:a05:600c:828e:b0:4bb:7ad9:2f22 with SMTP id 5b1f17b1804b1-4bb887853e1mr340731425e9.0.1795621183256;
        Wed, 25 Nov 2026 07:39:43 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm474497565e9.9.2026.11.25.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:39:41 -0800 (PST)
Date: Wed, 25 Nov 2026 17:39:38 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 8/8] ata: ahci_imx: Use bulk PHY APIs for calibration
 PHYs
Message-ID: <awcBID5pfFm2FadY@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125043639.249525-9-inochiama@gmail.com>
 <20261125043639.249525-9-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073951_474902_23AB4BDE 
X-CRM114-Status: GOOD (  11.35  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 12:36:39PM +0800, Inochi Amaoto wrote:
> The i.MX8QM SATA PHY relies on the first two HSIO lanes for shared
> impedance calibration. Store these calibration PHYs in a bulk array
> and acquire them by name with devm_phy_bulk_get().
> 
> Initialize both calibration PHYs before powering them on in lane order,
> then keep the SATA PHY initialization, mode selection and power-on
> separate. Use the bulk helpers to release the calibration PHYs after
> SATA startup and to unwind failures without repeating power-off after
> a failed bulk power-on.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

