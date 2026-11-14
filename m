Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6744606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VWMamprS;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C7XrrCYL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uDXGjtYZFeroFxSXYLMZqZjQ3eUeUraVZ8Yi3Xsfuic=; b=VWMamprSyy8j8z
	oDLQyaG6x6LmMDviVzSySrXtxHtIJXq7Zx2dcUJz517Kney5MJkXbTTMd7yAzyYh1ELcL6Hg1diyT
	kfE3JALfvTHKCYOmewt8wpy3w27q41NKBujbCfCNryenX2YbLLTOQfzpdfYYFYaLUNJUCs2hkgRe2
	+tdBs2Plk4CnKv8FSSAwditg3HE0RMZXo7Yvz7y9fWEcxyPJlZ2mdyiaQAiu2nv5YxCpvdPni2z1Y
	RVWWuKgkqDhSljSGHabNwRNvRFPwayLIl1ZGozdcgoyxYHZuCd+GBUKAnCMW/Ng0mUCyRy92hW7qa
	GzpB/IdowmK8p69gB9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Ua-0000000FHRU-14c1;
	Sat, 14 Nov 2026 03:31:52 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4UY-0000000FHQN-0dic
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:31:51 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-cdb628232d2so1751349a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627109; x=1795231909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDXGjtYZFeroFxSXYLMZqZjQ3eUeUraVZ8Yi3Xsfuic=;
        b=DGvktqExDQcONveuwiXatEB324Tvrt7hilWsxSG1B2OXfUrJviZIxI4BJDd8hWv/Gg
         MjaDiEXd/e7crtmRSXPf/4n1W8g1/cHyEh45GYYTANB0ZYli8AH/3v9QY3Imwf9Nb9xZ
         MAm81VAeaIALmpqzjN85kQ6+uTwmTcODhfa8OSM96Xw71D5CJAdduNOS8r5o4Sow5bjE
         yZGagSnFV2L9fAFWIwTlB3GD5PGwWgNc40r0Hgcheqg8wFPi3SLrBnZhxULmdgAxTx1+
         d+iJtaKAy72orf0lyqyRG2SlAVVY7EqyQi2RXLwsdM7/Mw+Y9WcNpkDK27S+3M/+Bd0G
         mBPg==
X-Forwarded-Encrypted: i=1; AL+hErEVybFyuDiuyx9Y3FjT+X9Mzyx/t+eEzGLq3po4RZVtiu1V36ASlDS3c0vvsbg2+fXzIb5+H1M/8swu1sH/UU/z@lists.infradead.org
X-Gm-Message-State: APuU4Z91KheCwOGzaZSqwaUxEvxB3+4decNBeE4ifQmCKPSeOSsLFs7T
	00Y8FiLZTymDrtVUAvVM2/KXCo6A39yWl7VWJr34kVqJMDdO7z7f3EXV+iOwQlB2axSL+h8ZQ4O
	e9Ml9fhOPpmPhYyCGNnQ9Wvv8MRejmqdQcjCciODcbus7XolkG9nVI6MpPl3Wo57q7UuE+e8wte
	Zy+bFAwfZGQFfegJSbyh6KaIrasSuzx/TBo8bH/Igil2UUF0kegLTxqme1AcIWPUVhFf2BaLx3A
	Z4H82yjWFgNaBj4dSMYKyQBJjvOTg84tpw=
X-Gm-Gg: AYBFou1SuuzF9I0t3IblpRuZJiYO5lUqHfHd6laFTfRzOTrFdpDIE5OBB92F+UyYzKM
	acTrcYJ4TKqDyYXg0cHt32k5V8VF/R8IxZepHBWc2iwu+lJlbn2kBOkfIaqj+NQbcF6sw6NBV+T
	jLjLxKFtU70mqNV15JXj0G6g0DHg71cLUmi4kRlzlHNLpFF0AGgR9Fhyhrvmvv8wvsFQBkFXtL+
	ZZvKFQRUXlo/mNpMHf2TNFrRIOdJmN4W10SJwTI/b2o/R9vQCwd2sYYTn3rpzj8/PAsg19DD4F4
	EMBN8iW1k0x8d9dpThEVDxOIoWMiSBL6BDBIxnNccNniYoby7EWzPDh/pNHnAsEqSk+U+UE3vxx
	uiWFpOrHQdQ2okJwAR/gpPdJ9JtQmnle+KPuI29GVmsvLkgrmtc6pdOoyFC5nwJDw
X-Received: by 2002:a17:90b:5112:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3b1b0cf4395mr4709972a91.48.1794627109396;
        Fri, 13 Nov 2026 19:31:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b25d9ba7sm1826082a91.1.2026.11.13.19.31.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:31:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08be1c84so25818225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627107; x=1795231907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDXGjtYZFeroFxSXYLMZqZjQ3eUeUraVZ8Yi3Xsfuic=;
        b=C7XrrCYLXb10P9X27DJFklzb28/vYP3zKwHphMV20Sf4vZmIzPCff5up+G/PaYwJHp
         GwxoTF8EKRbktV3iHHrNoOG9oUbTFKV6+oN/xbhb5czGEXKJyAHvIAv8hPkkBW9SPe+W
         QLElQnPwLePwx8s9UEVEtkgmlo2ElNXiOUVRI=
X-Forwarded-Encrypted: i=1; AL+hErFJKzVcUFgSWj9OKBwvp7DeU4xryb8lbiaLWL7tWqkM25jcsxAzbzqkA14bBAivvOBSmyDkxp5xvPcxPsGUQNrw@lists.infradead.org
X-Received: by 2002:a17:903:1aab:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ee0ddb1fc5mr48907055ad.25.1794627107449;
        Fri, 13 Nov 2026 19:31:47 -0800 (PST)
X-Received: by 2002:a17:903:1aab:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ee0ddb1fc5mr48906795ad.25.1794627107044;
        Fri, 13 Nov 2026 19:31:47 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75b489sm17051065ad.18.2026.11.13.19.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:31:45 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm: dts: broadcom: bcm2835: Add reboot modes to firmware node
Date: Fri, 13 Nov 2026 19:31:43 -0800
Message-ID: <20261114033143.875897-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-5-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-5-56f680ef4734@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_193150_198012_BDBAAA28 
X-CRM114-Status: UNSURE (   9.78  )
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

On Tue, 10 Nov 2026 14:00:15 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
> this mode and normal boot mode to the node.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

