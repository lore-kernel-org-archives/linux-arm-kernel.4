Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00133606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IWdZ29j/;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xp48Yo1i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hpknOOfaXRSRwzsy+zJvYqiC8yonJsdMZo1b7Unb9Gc=; b=IWdZ29j/+1o6Ye
	BO1FrhH4a6bn3h1w465QwBHo6QNNt0A0Urfuz6TAxe186uU2+bsEiFpK9DJXNGCiJQaWjCf5YzRwK
	a4qGTIMzdFuJTrg3CVlaKE/xqCoQfhvY6V9PknjI1CnAQ8JftfTJle13pOWujyB8vQxQuM7LNcoEZ
	Hs32N3te1CZGvhaqVadMjiIi6kP0y2BKNDFgzZLjQFuo/xTYRWIx/hdlUtZGiq3nV61F/jorjNNQ3
	GkAuUPHf5NRTOz98QAFAwrCFY4hSPtpa4y7kt8HLfgH6MWHh3FNUrSMHgjNSkv5y/U9mQ+XypmR3d
	/dXQzmXWVXAj8aHQGm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5nd-000000047Ke-2j7J;
	Mon, 16 Nov 2026 23:07:45 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5nS-000000047DI-1s8G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:07:35 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so3802903a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870453; x=1795475253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpknOOfaXRSRwzsy+zJvYqiC8yonJsdMZo1b7Unb9Gc=;
        b=T0ZCo4fpFM7qhBsHe/geViR9NUDUfqZayvaW3rU/qaqZ+YDMqDbiCAMAp3j6GjRllW
         Yh8XprjzbipGFnTVWQhCphW3eJNs08AgNDbu9b/3kgahz6OzYzUZX268GN4eavM+m3kv
         Go/9PUL75cRaFX8Xs4pa3pTgi5QPXVPoSs5KKvm2l1bashGKly2rj8icW/VLF5z1orVC
         L3IWw7E97Yj4e7foDx6svRJdHMRdl7ZJjYy8704sKrLc9tI6yBJ107ZCP6Kt8VV5HUhd
         IT7JrS47RCFrCrycTuxu4xkivsg3/32bzWXPoj7b9lhO57B9dIK5pqRji4BRW7mP+pno
         K+Wg==
X-Forwarded-Encrypted: i=1; AL+hErGfP3xktWUzu1rj87XVc68BrCldCPxy0Wal/JvTHEPN1AJ3RFpX51+/2T6jL5Tse9pRbJLDseys7C/YVjrpjCF4@lists.infradead.org
X-Gm-Message-State: APuU4Z8blPG8MVhgqz/h/QhOwGxbhRIglrLYbTSXzUOCIErqIMsd+8YU
	mRYHnJYmtQP6fdeKyznF/7wi4iiaNmokVerDsZlUIEwh/34nB+UPdmf+IOy00ljRpvJko2HKzGa
	MwwbNPpTWqJDoxOiwlOJVghOmfYDAjbqE17PA6TdvQh4NN9XZ986oHMM0o5reFSb7npEVUfHzlN
	M9+XHSe8nruYukQwCVy0Uc4nTZpjRZs+IUcT5t7x782n0ktbUyTUFsh9L09tEYigo6mREP+dSeb
	JbVrFiZ7VIQ6G8oYsOqCbiE6TQLbyrzjyg=
X-Gm-Gg: AZFdTZfifPXVxwXBY6nWV8M+Tns8uEau4jmREcyiGwwirD431xEJenD7ViWUewMOX9J
	K2Zyv+x5M+34bF+B7e6QugV9IyWj8W3y9gTM8nz2hS91b5lnvotqOufmXfXVp+a7S7WfiYU4Iga
	mP1SQwXoIY/YTA14ts7qLH2c1kvnBwCFylTg5YbwJc4Oc6RlVnMEm66H27e+DXYz4TU+TamTNzN
	SD9jPdY017avsm+zfDbeiVjLe2wpJ8jmaE/CClbU2uZPDwPf1/Z7DBsRm166d19+LEX3b5NFTyR
	skRnndLdZ0btwpGMlcXn01o9666l/ZPotR8YsJqmj6iOgIH157woddr8FeYf5Ww8V4CzCMd55E8
	JHX3h0s+8Cf+xUGCH4koplZWEIJaMUrev4MkvaG8MY/3ZNkp26KQRtvqfQWaCdUbbgiJza+yh6i
	yxJU1fKGEQhV1LKBj9NQSaNMSMNzxZOLeppP3OlNMy
X-Received: by 2002:a17:90b:53d0:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b1b0a10840mr12018129a91.35.1794870453533;
        Mon, 16 Nov 2026 15:07:33 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b2654977sm5014953a91.1.2026.11.16.15.07.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so6132560eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870450; x=1795475250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpknOOfaXRSRwzsy+zJvYqiC8yonJsdMZo1b7Unb9Gc=;
        b=Xp48Yo1irzJNaBE+kMJu+ykMbt6WkPT8HoSQiICVP5hNaOLJEYkW1XNK5zPswIq13K
         +n0vIj127onffrTo8Z/958tJbsYSlQ8WWxSRT+A+WfgpsUyTUx0I6qYeg6X807Cy6h6W
         uYmUM9OSjgDnfQC7Uo4XwrhJyOkJQg2OXdT2c=
X-Forwarded-Encrypted: i=1; AL+hErHSy6/DjAGkbhtAFjQ/lYVXHqEMAG/Kg1jlzX+mdeNPnOsSL2PjtCaCb9iwT+Z3Zso0A578vaHZxJ89UKvb7XJP@lists.infradead.org
X-Received: by 2002:a05:7300:cf8c:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3796628f4c8mr11453318eec.16.1794870450458;
        Mon, 16 Nov 2026 15:07:30 -0800 (PST)
X-Received: by 2002:a05:7300:cf8c:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3796628f4c8mr11453300eec.16.1794870449743;
        Mon, 16 Nov 2026 15:07:29 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380e031f3e5sm4677314eec.12.2026.11.16.15.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:07:29 -0800 (PST)
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
Subject: Re: [PATCH v4 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Mon, 16 Nov 2026 15:07:27 -0800
Message-ID: <20261116230727.1490184-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-6-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com> <20261029212513.4126083-6-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150734_488639_37F8649E 
X-CRM114-Status: GOOD (  13.01  )
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

On Thu, 29 Oct 2026 14:25:12 -0700, Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> The AHCI controller on BCM958625HR fails with the dma-coherent property
> inherited from bcm-nsp.dtsi. Soft reset times out waiting for the first
> FIS command, subsequent engine resets fail, and the disk is not detected.
> 
> AHCI allocates its command tables and received-FIS buffers with the DMA
> API. Declaring the controller coherent bypasses the cache handling that
> these buffers require on this board. Removing the property restores
> hard disk detection and operation, as confirmed with a diagnostic DTB
> that changed only this property.
> 
> Use noncoherent DMA for SATA on BCM958625HR, matching the downstream SDK.
> 
> Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

