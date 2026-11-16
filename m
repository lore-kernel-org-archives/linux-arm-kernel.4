Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3730760A2608
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X7F9omhb;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F9khVYej
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d7QIkQGcuhgCwpwukZfMYl/m0eNiW9yDpQCv/4z6USA=; b=X7F9omhb7FaK8w
	VK2nDnq5zplYRs/V9LiFzfUFnjQ7EfUi0kPINSBxyQ3hVda64ZHql7SH1/xC7D7ikLgaMgeNLgyZb
	lbrqc0okScTYpF5LqWJsKhPEUqzkNZZyLGnMwD00vaqhAYQ+hBA6weZd9q3opBxwBtUcBBYk6hTXE
	DaOhulkWfgI0/zrLQpGNH4p76XvDiVFXsdgst0nH21+a8txewz/dSAtwsgDjD5qdmUMvW4XzrUv60
	iryY+cSrC/udOSYtdd4+xdkHx4htYezY1fI94mhpfoXXz/xw5Um5XPu9rSuuvM6VUniFZw37NkeFD
	+k8Gv7WHkpVx1JJUN9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5nT-000000047Ds-0htA;
	Mon, 16 Nov 2026 23:07:35 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5nF-00000004751-14Ef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:07:24 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso1886925a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:07:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870440; x=1795475240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7QIkQGcuhgCwpwukZfMYl/m0eNiW9yDpQCv/4z6USA=;
        b=DKgvivakfbDSB3j+RjnmzBjAQxDbo3m/BrjQKBHZ0cLtBgHRh9arcffpYbJSKN3yn4
         NRTVdNoO1PgG+O5cISznQxZBPuvNbpdSapuLuyvZ9328jUSGcUHrB1LKLHaIs/mvs9o3
         GCarRFkeJrt53qusIWf7z9nWVMIn3jl3ghPtnKUgSNyIv8/QszZ+HDfwyQoIpRXmuO+t
         3TXtdNgv1rlxogE4usx01NRZeyVcZN7VtaoBw7lGggE3pztkd0/hpukb0FPzQoAZRhQM
         gr5OIxKyBOD7A9uCHKJbddS9gbpMofoEgTkHwDILet7rBkpInr9mpTgnAqGrg1sUKDXm
         Dupg==
X-Forwarded-Encrypted: i=1; AL+hErEKxdSJjOvqUrRPmZCa6mUfL99ydU3oseT9a2hzGiPvbwPTrqDF1vKcwTaH7wcHAV22pwWD7aV8+mfmuDiv5R11@lists.infradead.org
X-Gm-Message-State: APuU4Z9i0zOI28wiAxGzQ03WcPpAHoPZNFnvaj9csUOZSEhM3E6dzoO3
	q+akkpOb+susycwJyN7r3T7EjQVg7Be9VoH7Qi89yhVFjSdIzU6pC45dQEbFIjDJf2UKC2s9NF+
	i5DsJXEHa1GjKD1XUgowSsep9UAEP/d0imgteitYdK6y7oSI67qzc9BiEozSx+Njkc/KN80FAeb
	EUnQJH+u6dMXqVc/Qvrqp49UTlQSK39/39eFlCFAoSK41wEi8qzghCWEbOuKxx7WG13yxTMrNhI
	WaQJuLfgjRbqGKaI3hOw328HXL+l+TGphA=
X-Gm-Gg: AZFdTZdKz5y9l3wjQF9M8u4gWuuIDJvdSsYLlqVM9EwbS8Da+h3QKVm0HlUfvwBaRVX
	TrS5WWiOXn2zNYyOvGSHZn25EJbtaAtx3GAjiz5uh86NNkq6r0Pi0cf+fPXkViGO0N3vBnV+2DV
	nUrQ2RKiw6F0Y6MEDXlchfwNusJYveE1oRziSmMV2wAlYATfe2xGDq8qEMgvprmKht0pexoxKq8
	RddSpkXPbAJnpbfT7I2cALMYxMnyvd0DGizTtCwuXwOt88DT/ovacPsZeyYxMyB4IKtZg8Sokd1
	5AlkybB15oq6mIf0oGQqrm2Q+clOJncXww9yiIAPpnJXYk4PAVHk46j+AYbk/FCMg7d7hGhDbBj
	/Emyk/KI9QNIfc98jjJ4F6jJyN017nJqOWDOpz+5+BUlyzDohTUtBr7tNsx1maFYtUo6KV2HmY6
	Vxwt7FTJy63Zmg1UMN+X3Rsz6+0tXrk13Ra6Sw9TLe
X-Received: by 2002:a17:90b:580b:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b1b0a4e826mr8899529a91.45.1794870440229;
        Mon, 16 Nov 2026 15:07:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb97be4sm536651a91.1.2026.11.16.15.07.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b238436265so2206881c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870438; x=1795475238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7QIkQGcuhgCwpwukZfMYl/m0eNiW9yDpQCv/4z6USA=;
        b=F9khVYejZVxmQmVrmwTWNQNy0kwmuUs2VPlTKE15y2bcOjhvoeFat/WfdWGWTWUwTp
         TdfS7aEszLDQrzWacDJHuUM/fwyGmoYsi/i4sXlTPEL9fsCuwGoFed59RTqz98edTW8L
         G/kW3p2qVzmmMce8oodr/x2lY+a8cQLr7GOrw=
X-Forwarded-Encrypted: i=1; AL+hErHcYABFogyYcrbiak9Z40rzbST148Xbbh47io39rwN1zGsHq9NUKlkQxOxPRvsZ9T2LpOkBi1q7qWmFTqQ2ujWs@lists.infradead.org
X-Received: by 2002:a05:701a:8458:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b522fb84d4mr6306506c88.16.1794870438545;
        Mon, 16 Nov 2026 15:07:18 -0800 (PST)
X-Received: by 2002:a05:701a:8458:10b0:1b5:22fb:848d with SMTP id a92af1059eb24-1b522fb84d4mr6306480c88.16.1794870437878;
        Mon, 16 Nov 2026 15:07:17 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm50516401c88.9.2026.11.16.15.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:07:17 -0800 (PST)
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
Subject: Re: [PATCH v4 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Mon, 16 Nov 2026 15:07:15 -0800
Message-ID: <20261116230715.1489712-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-5-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com> <20261029212513.4126083-5-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150721_308917_97726238 
X-CRM114-Status: GOOD (  11.04  )
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

On Thu, 29 Oct 2026 14:25:11 -0700, Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> The NSP SATA description omits the IDM block at 0x1811e000, leaving the
> interface clock and core reset dependent on firmware initialization.
> 
> Supply the IDM as the third controller register region so ahci_brcm can
> perform the downstream clock/reset sequence. Extend the AXI bus range to
> cover the complete IDM aperture.
> 
> Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

