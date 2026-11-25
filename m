Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27014606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hJEj3wmG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D6l0tCJ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=; b=hJEj3wmGXnj6tkEtk+jZRpRMyF
	dDuoBnWyJJOXRqKwNmNueafyYAHaOqk+0sXvOhXmEkBXlMKBP9r8JOJqWyAYWMK/9TKF6Qo72GgNR
	A3Joba0bn6rG6zUVHbrBy26YZrE/+joMdQBox6Q0MnjdfmPGrXSvpHI1ii7dFmFjA4lplcF3mOWA4
	YcfYLIddNEAF8bf7VeQPNtWPbTLbLO8DdPJW4UF0MtN1qnE+ting3wa/Oh6FTDqSp861I0PFhOppB
	hd5lUloB5zoZrNmDLKhxh5LkVyphM8q3pOXTfEhIV+WJHFrRxYmRMCwQrImSu5ogFSiXFMAXez+RM
	fFSslq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEne-0000000AK6Q-0Su0;
	Wed, 25 Nov 2026 15:20:47 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEnb-0000000AK54-1jrw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:20:44 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6ba863fc3e7so390507a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620041; x=1796224841; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=;
        b=D6l0tCJ3PxHNKU6NMYbaFWiLeFGXzNIWPD/unV0wEeZEv9/xTXWBiTpfh+600RWm0m
         WTomGTmxmudMP0gN0JPQ0ue1TRH5U8ivZBMUXp3uul0qOoxCM/+DS+xt4Yn9ZjKFbz5w
         C8jWbtIMR68PLbZiTcYUACmXWfLtB509N4o6FdKB8+l8KS8IYInicHFlpqPhqL+spUXt
         qK4ih1tbul0jF6m5vSX9rNh0HE15m0Zd7j4J0AgCX9Ip63Y4l2aS28rz/VSuktZhf5Fz
         rSntoUoBF+hDNnNhaRye/E//R8mNqEl47GiqyWq0A/oGKjStCQZf8cbA5yRdsW/05cXk
         SBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620041; x=1796224841;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7BBvICMuzzfnr5B7tFxaU0ZRbyofyJaoqar4LTl4jM=;
        b=NBD8tg4Vns0TxwOimrnQOjFUSfE1/Gd4gJABuCV8RYB2T/ezKqbb5UEcpH/d10KbDD
         AG+3QvahaOg7tcn8HjrMyfNpBRK52ry5MWOuIUe1mh2LFXBOTY+IUEeZp1/7MLjAZ5VG
         MuJrZ7SmouH4i18M3lbGppD19Ki9Q+DSnVboTDWbYSMtr4W+ybHV5HHBmzlAIBK1XFt7
         tdNOmOlT+UbrsEPizIyhXAHIEH3st6UVnlvP8I0doAx3DzVjIy2hbEsxwFMiJ29I4sim
         bonols6S8yKRXMRq1FyPYm36eyWyYE+VuNV4PRLAm06ua+ZG/VkxFfBKkuBDBMfJ9Q2d
         e0hg==
X-Forwarded-Encrypted: i=1; AL+hErGND4ntnpePbyLuSMXB76P5Vxd0U5mZvRJs8JwkkwzVMYSZjQQ1QdkosslLqlnh7n/4U8+EWSVZbapwVD8h/nLl@lists.infradead.org
X-Gm-Message-State: APuU4Z/w01mm/aIczJkY2qtxiyZHKcCGtUY80CTE7Z0+hQ4PhGsGsz4y
	ht3iRwsmZSD8yjYnukrbPVQ7ghBpdok1Y8bC7m33PQDwe/4Gj+3bvWfI
X-Gm-Gg: AZFdTZf/2ypvXO/a4BjTozswHnI/itgk8rO+AD2c5wfqQeWtshe/sc7uA2Om8oS1dHw
	H5j3Q8O+xOPn2LWSDBQJ26n3CsGljsL0BFsAi0nkMQwWyQCOLmI6dJpv04KHJSraV3p+wkR7Qxl
	adzOrbLraGM2ZHWazXOCk4gtXgWTXJuWaSGlYueIYCUHPbNVDp5s+1k348xsFno+rVOmklKANhu
	1eXfnsk3cJnvmSw1aA5dKbP3NO9kB/YRgwOpO/4RaG3qBU4rbAsy7jk8E1OaTAn1O75zewa7VSB
	uDrEL/KIlukEohO8aN56YgK7ZXg923zmE/E11jC5iB2tgBaBSb8F7w9Oi8zW/b/UDtn+nNf2VqP
	TOUtnndZq2A6v7sRhCPQD8/TMl7L7UEn5yfYZy50yN6i+qPiKhq1oP1sNMg2BeGnU+4YGifYHYr
	Bc3rj5FkJVIEeZsuxh6zYfk0leP/eF3J/LbccpFdJWbmjVs/hjP2JcjINW0a32zIP+T+HAufoeM
	SG/78y73GjyyAF2jz5nzzE/XzVb3KSeh72V9sGR/Hvx5/AfyhemyPG94+dLScQLVDIDFP2nSwTk
	2mAUCRs7xKK8QV/LNr6Z
X-Received: by 2002:a05:6402:90d:b0:6b7:dace:635d with SMTP id 4fb4d7f45d1cf-6ba37ac9214mr15694051a12.0.1795620041130;
        Wed, 25 Nov 2026 07:20:41 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e78a7sm8131962a12.16.2026.11.25.07.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:20:39 -0800 (PST)
Date: Wed, 25 Nov 2026 17:20:36 +0200
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
Subject: Re: [PATCH v5 4/8] phy: core: Add phy bulk data helper functions
Message-ID: <awb8ZycWk2PJzTUD@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125043639.249525-5-inochiama@gmail.com>
 <20261125043639.249525-5-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072043_518299_315C9495 
X-CRM114-Status: GOOD (  11.83  )
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

On Wed, Nov 25, 2026 at 12:36:35PM +0800, Inochi Amaoto wrote:
> Add several helper functions that allow drivers to get several phy
> consumers in one operation. If any of the phy cannot be acquired then
> any phys that were got will be put before returning to the caller.
> 
> This can relieve the driver owners' life who needs to handle many phys,
> as well as each phy error reporting.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Transient build warning due to improper patch splitting, please fix.

Documentation/.renames.txt: warning: ignored by one of the .gitignore files
../drivers/phy/phy-core.c:1202:12: warning: unused function 'phy_bulk_get' [-Wunused-function]
 1202 | static int phy_bulk_get(struct device *dev, int num_phys,
      |            ^~~~~~~~~~~~
../drivers/phy/phy-core.c:1242:12: warning: unused function 'of_phy_bulk_get_all' [-Wunused-function]
 1242 | static int of_phy_bulk_get_all(struct device_node *np,
      |            ^~~~~~~~~~~~~~~~~~~
../drivers/phy/phy-core.c:1274:13: warning: unused function 'phy_bulk_put_all' [-Wunused-function]
 1274 | static void phy_bulk_put_all(struct device *dev, int num_phys,
      |             ^~~~~~~~~~~~~~~~
3 warnings generated.

