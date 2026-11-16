Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78926606A8A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3vhplzO9;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FL6lvdEw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wst+LDRzcSVTFePzkpCfXygrywKuV6vnyIhVCYwr1YM=; b=3vhplzO9832bcD
	Ts5bFxOc/PggTGQOgDNnseZkvyqHNarBQiWYuft7p7YExzdtpsIb8t69TmgMLti4ZQvkFJ9fjXppg
	Cl1ebXdMnBa7EVtn1HwgBrfx603UE6Jfc00RQ6iXUmF1h1nuW9TgO/0tN3kpTK/YGysqAYuxZNfap
	lR4aswaRBr+dHe7cU8fFhGch7i2N3njYcwo/H7V6o9PYBuH4lZ6zRGpE8HQoZOiiTCvBaxfYn7lZZ
	Tk/eov1b+z7L84qa/eXPGUCrbYKeg8cTkDXwpZq8RvjRuggQ+Q/YHP8WqZ1std42JhaPaUwI1/Idx
	h3NV5VDK7wpzVukNorXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5nl-000000047PS-3fkS;
	Mon, 16 Nov 2026 23:07:53 +0000
Received: from mail-vs1-xe63.google.com ([2607:f8b0:4864:20::e63])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5nb-000000047JV-3cDf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:07:47 +0000
Received: by mail-vs1-xe63.google.com with SMTP id ada2fe7eead31-7d2db6408cfso3210988137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870462; x=1795475262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wst+LDRzcSVTFePzkpCfXygrywKuV6vnyIhVCYwr1YM=;
        b=ZtCpa6fz4VYh4KXgLJSUWAc6/rFhb2LAk4xtGpee7BgtfSb0gSt6rekoMdc/6Aokd2
         h0d+qxgJpnBQzdnFFQNBPJ53OYeU2j8cLGsza67hvxOk6XFzKI2mVGoFLZOwNeETVeQg
         /uXNO+tn119Ok3WPunHKo36mXC02l/WlXppnqs2e8uMBRXw3JCZlY3nlBpAdZvEOHFGD
         08xsV0aIiar1uMMFvWfXSqv4kxEkiI4ZJupyxni878PCZLTdIQawWquHSXatHuaGwIHF
         JG8w6LP6RZ9XV9+zhUTM8Pmha/ulflokt+gEXY3Dow3F+aZokOw9LScKUqJDp92F54bh
         6bWw==
X-Forwarded-Encrypted: i=1; AL+hErH1e63mN9ElhXDN4akoB1+6OmPZzRcHOWqqy4ZjIg39kgk7f3wb5xv/lFRSQqzf5LnN8fnMtJRPonVUrAFt58Wi@lists.infradead.org
X-Gm-Message-State: APuU4Z++TCI6pfH4k+NSwcSVpR7QdYZQilWWRCpWRcU4BqziN+XYCnGC
	JkE+ZWbM7cdGeDSUQDmCtGimEK1WR72hWaLf8tlsCukfSAt0pvjyg2eGhlmpPQeCGsPu5BlpHkx
	fmHT6YCR7t6SabiM4qlcJrBdb8r5+MISLkvPoURBJ/C+CxSX8hP6+ooh0Tuqmqck7CRHN9QQVHc
	mL2RCAXnTimtqwFO/bO6maY+HsM3FVYHlseFaeP144nw7qv89zzVuaZdgHkJvzb/N3RnIZo2dFC
	4fcaqFn3wSPL8MqTZGwJJ/4VVBnnwGXOiE=
X-Gm-Gg: AYBFou3X1Jk7YRQA4W+3/cWeLHxNb6m1Eo/PcsOXJCIIDggGmPQjtImvyHCr+bCGMAk
	1rUTXA0cWOv5HVW7tT1mbI5+brd/IjcAmSLhROke5FX45ds5P8FGhd/4VOtRHEff/s8lIfaq/z6
	UElV0R3d9VJ+94RHCQPB3uiYrzR1bd8u/n8dmBjgxwbq92a9ALOUMy86rrKw7OEHN1gIn5BDxt4
	aHCBQ2MXZeETcofTI98ryC2U/NleigLcklvk95/6Ozsx61h8dxz0fr8zg6sY95Wj3Qvd9Qrss/V
	gbbs7Oaf6Hds7UMP0OsFCuT8nQ9P9jJz3aPqYVqWXl5MA+qjm4ZHPLiL38VCn0Z5ePXIBx4Au9S
	gTgPSJWC3A30yFxyfatjQcuF0YCwJv9CX0FckxkJcDWcFHwsBNMn8AyKleqerjWdKy/QCEx2ezV
	BCxh//UmFUkfp60rvTIhGKCklVVigt6GymeuV80ESU
X-Received: by 2002:a05:6102:c94:b0:7d2:cbb5:71fe with SMTP id ada2fe7eead31-7d64d8bc684mr4522671137.29.1794870462362;
        Mon, 16 Nov 2026 15:07:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e3382ac81sm123526241.9.2026.11.16.15.07.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so2271653eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870461; x=1795475261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wst+LDRzcSVTFePzkpCfXygrywKuV6vnyIhVCYwr1YM=;
        b=FL6lvdEwYhri/0eK9M+jVUnaSEVGE8vGqFlO8G+3BNZ16jM2PhV0xMCzn4cKJc8e34
         HFuJLjlQLUtAhjBcrdehARRM+RtsrZg+pMd5PU36YPdv788pPB6sjZXvFxMn2TAxtfkO
         dTfe98rM0luMOKv+7OCrDYVnJzzl9txvz45b8=
X-Forwarded-Encrypted: i=1; AL+hErFK/Z0ap4oTVUImiABfWV6HsqpRjFGkMFsFk/tQmjscm7lirnUAzSXPV/5LP9yyPP1C57wvcx54MPZcz1wr0yVB@lists.infradead.org
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr12357845eec.26.1794870461056;
        Mon, 16 Nov 2026 15:07:41 -0800 (PST)
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr12357825eec.26.1794870460396;
        Mon, 16 Nov 2026 15:07:40 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm36874961eec.29.2026.11.16.15.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:07:37 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v4 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Mon, 16 Nov 2026 15:07:36 -0800
Message-ID: <20261116230736.1490551-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-7-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com> <20261029212513.4126083-7-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150743_928100_6B5A4D79 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 29 Oct 2026 14:25:13 -0700, Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> Commit 77416ab35f57 ("ARM: dts: NSP: Disable AHCI controller for HR NSP
> boards") disabled AHCI after reports of boot hangs. Both SATA PHYs
> remain enabled, but the disabled controller leaves the eSATA ports
> unavailable.
> 
> With explicit IDM clock/reset setup and the corrected shared PHY
> register aperture in place, enable the controller on BCM958625HR.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

