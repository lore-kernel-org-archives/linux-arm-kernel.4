Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F414E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lioQaZrU;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IuBjkmzJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pa6VwfvBf/lmyVIlZAJGW65vNYl8kWvkzCZbBuLoYbU=; b=lioQaZrUPsFRgP
	eIA6w5GDs9DU9yjNL2SNBByH0LT4tzs+MMcw2Q9u7fLhp5ve8MUy7tMfTzyC1un8qZBOdGbIi93vR
	kDmHABblg0S8C/birElYvPNMUdkSnce8PTg8ynJbpmzSssPWpdA+Y8ZTExXFWpBfydCivM0LgjCj5
	vTDGAFHzKW5lg1pfbiFz8vhh3tTCuIOkCLj+nbaaWvnyvSJ1v0rRnffmckKY/OXYEVkrq4E0aOxRq
	PV6SHGGZWoFG7e9gcbztMzhWAkshw9cDL9Bzreiu+OgzIsg2ycGXtsP+jxLZCxi/8kK1NBJd9akp4
	MxvPGQD3tM2tvR5ShR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrBq-00000004sDf-3l0C;
	Tue, 10 Nov 2026 19:07:30 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrBo-00000004sDA-3Sk3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:07:30 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-cdd89d84521so644279a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337648; x=1794942448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pa6VwfvBf/lmyVIlZAJGW65vNYl8kWvkzCZbBuLoYbU=;
        b=LxU3Rd7o+mRmCWLiUzsTCf5wNwK1LFSU32we2iRjHE1/slDpwtIqFmRW8wrp3PTJCJ
         W0FsfCmxsTlxslavxa21xH84xDbgvd/1wucks8+0m28vIxvYvJclcrkVrl3ey3d14Qfy
         ickLYdTXr0dzHF4Mw7a148sn/l5PUCATLZGgcdQexVlvgAz7p+ArEH/PBkNjrSOo8F51
         VvWXHzS6ommsivQ9Jg6Y54Zjd8oClbXp11U3gW/79Y0oHnbexrdV3MPX+OwY7wvlcpHj
         Xq1a5yF+fL6DPTKjzCkPmG+AOfI5MXviWcuO19NgIsyuaIgb2T2KDTqO48m4t0yF1K+n
         hILQ==
X-Forwarded-Encrypted: i=1; AL+hErESNV5dFMJDBpEv+VjHXLsVDnoi02gA+tx+Giq3Z79TXtYEg2+rWbmTZonYxhXlLfh/ZmlDHdjerH9F9JtdDgBP@lists.infradead.org
X-Gm-Message-State: APuU4Z9R9L99lutIcXBtamDARfeSXp7RkpTvLW9Wd3H/A8fzelG9Rkrm
	+lFXrzvYoIIFqWcS/GKivEDApcMv9mtdRdSoiuGXKGiCnoTS0C2DEd7DNv0B0HwT8IFV8Ya0q0N
	0h13r+Im1sb+95knI4ys1ALcnY42iqSDKUhnQ0zBJ/89VAEpXnv+kHdINSe7kxBPr5WqDOYjxkY
	YGxmzL002ExxC/G4mj3oyUHsBjBXey5m2OwUuiQMZKrjNncbqnbjbigqN7TlKxn1ShuqSXSIrLl
	AqlMI5neuxtkDpTu3UuYhJ5F2v+4xNgDcc=
X-Gm-Gg: AYBFou2Cwn66cjh6h4s4z1en/tkpvepZ3DclIkWpvRsF6fGLB+fnAyvhN+JP6+Sy9lE
	k0sdQQb+61gDI5ZdVuOFvLB63ZXLGhRlkRIhSNj6fRPJjeUvDSx3TScdt6nDhFIlPxHsISFlrtG
	qyFNZDM6KISoKCRCyVKoDRVawnyevdOX4I12jMOURAsMW+5vuok6soPhgPl9p7Ioamb0X3z5iRv
	vHfR39nphai2rXPBrBhluL8piBLwfu7OFAR+YMzYU+qo/sf20NBuOM1lsWIPC/30zv2WuLN7ml8
	pNSx9GeG0TdhpZnv1hGuiQGEOMgJmkPoiSaDPYAVidMwJ/l4DH9V2YI7XiDukVkPn7W14TVUckU
	3+ijsjYsdJNyHKhFlQefEnCEIitEkgnmfGhp0Bf90e90uQdIHArP+4uUNUmVm4GUZMm0+7N0qrC
	a5uFukmbngQhPPJN48S6PbJrXLjgYagoJvqIo2OT/P
X-Received: by 2002:a17:90b:548c:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b1679e96e8mr2140959a91.31.1794337647762;
        Tue, 10 Nov 2026 11:07:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17db3a05csm442533a91.4.2026.11.10.11.07.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 11:07:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91eb3a63064so50696386d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794337646; x=1794942446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pa6VwfvBf/lmyVIlZAJGW65vNYl8kWvkzCZbBuLoYbU=;
        b=IuBjkmzJef7jG/0n3QQpHKw4lm5cFhXJeV2KtWGiN9bYScr8ZkWN+DXFMBfWniQNDK
         QtI15+zD5Le9P//IqPGPtoKUY/4Aaumdacn7DdBRrtg9eNs6qezygvHS5z2IO5RFcTf7
         MiV0VXkrgl/lpltV+OrmiCRxagmhce1EBjEFc=
X-Forwarded-Encrypted: i=1; AL+hErFekVgIa//srG2TmBQHclbX2ZBLLHSUoqZSr/Yp8EUq1FaONQeEJDTN3CD8jZztvo3qEb8yqaJ8D81PSRxAPURg@lists.infradead.org
X-Received: by 2002:a05:6214:e87:b0:91e:b7fd:8ce7 with SMTP id 6a1803df08f44-91f04122ec1mr3192256d6.28.1794337646221;
        Tue, 10 Nov 2026 11:07:26 -0800 (PST)
X-Received: by 2002:a05:6214:e87:b0:91e:b7fd:8ce7 with SMTP id 6a1803df08f44-91f04122ec1mr3191796d6.28.1794337645698;
        Tue, 10 Nov 2026 11:07:25 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f046e42a7sm448086d6.31.2026.11.10.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:07:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/3] ARM: bcm: Add CFE SMP support for BCMBCA
Date: Tue, 10 Nov 2026 11:07:22 -0800
Message-ID: <20261110190722.2345878-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-2-4103df2588d3@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org> <20261105-genexis-xg6846-smp-v7-3-rc1-v5-2-4103df2588d3@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_110728_881382_6864C56F 
X-CRM114-Status: GOOD (  15.33  )
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

On Thu, 05 Nov 2026 14:24:47 +0100, Linus Walleij <linusw@kernel.org> wrote:
> The XG6846B CFE bootloader powers up CPU1 and leaves it in a holding pen
> waiting for an interrupt. After waking, the stub reads the GPIO
> GeneralPurpose register at 0xff800568 and branches to the stored address
> in ARM state. The vendor kernel uses this mailbox and a wakeup IPI.
> 
> Implement the brcm,bca-smp CPU enable-method for BCMBCA systems
> booted through CFE.
> Read the mailbox address from the secondary CPU's cpu-release-addr
> property. Map it as device memory, write secondary_startup_arm and
> complete the write before sending the wakeup IPI. CPU1 is already
> running, so no power or reset sequence is needed. Using the ARM entry
> also supports kernels built in Thumb-2 mode. Clear any Thumb function
> pointer tag before programming this ARM entry address.
> 
> Register the operations with CPU_METHOD_OF_DECLARE() so the CPU
> nodes select CFE bring-up explicitly. Build the BCMBCA machine
> description independently of DEBUG_BCMBCA, keeping the debug UART
> mapping conditional. The generic ARM startup code retains PSCI priority.
> 
> Suggested-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/soc/next, thanks!
--
Florian

