Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109A3606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xuP7zicS;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GPfQtm72
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f2aTJR5ujlY1iuig4Lvg9F+LskDwvfVaLLYuQpm8ut8=; b=xuP7zicSn82245
	69MSxc6xCBSyoyiRCAY4kWuu/wUFycKHOXfKp8xYjU6DNCe5STsFtR/HePkmUT3m1vnOS/9EzlzBJ
	c6jxf6QzN+7T+uMzhifXdHLx3wUQ5GvIqCPy4o7jdbyznmywDXA+fwSzw05eqGXkLXII8mo5QXcGS
	KC9hf6mbU3FV7gjiAWlH61as7D/yNQ+2rzaKg3yNxvC39BH1sLRAYZPhDWYgN3c55mdndXtxm0l7u
	QJmJTB4n0eXbnJkoCksG8HDXqUhiexEc3lhp6CI1mmo6oPycJLvkR3pFaXem8wDCYeI7Xshk3YeQZ
	qq/XnLuNSNDiKrx70bhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXbM-0000000D0Ff-3bvz;
	Thu, 26 Nov 2026 11:25:20 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXZ5-0000000CyHM-49yV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:23:21 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-38190551625so13428224eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 03:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795692178; x=1796296978; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f2aTJR5ujlY1iuig4Lvg9F+LskDwvfVaLLYuQpm8ut8=;
        b=GPfQtm72Z6kk2zRbrRD3MzLKbwQMyJK7gYKhw9l1g+gTSqF/IEFzzyLLf2etsLo5h6
         39bb+OgLMtXgotLwESDY54+2xL66B9Pj/flIbM3RyBAJcWwiPiZ3ZHbtDGgdQtf084K8
         DhNkU665AD5MM3t03oAKJL1E1iAE4cIOWw1xfkU5LX5v8vFdb0FqerSyIjbeOayFxnCV
         e3o9WZyW2jbUCc2NRbuK+CxkBq/vL4QnMHMtI/o64UvQPpv+P6zxEnVORD5tokhMdWkD
         9MOYb8QQYgXJj+Vl1dg58qOvLJSTL4y+0HX5ru7nhYSMmRp4rtniLNiq3U23dTviJ1fm
         eb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692178; x=1796296978;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2aTJR5ujlY1iuig4Lvg9F+LskDwvfVaLLYuQpm8ut8=;
        b=nTWgYx+Pbbhrho8lXwO212Ws2EGJdV2wV1DIfHmS0LO9hWVEhT873LrsQiPJdx5DH7
         nMmE1iWwMDWhipKCEsGHg2tStFYzd5fSICIGGLq4gc6U06zGhiqYw2SwtruoEngKjgCe
         Y1sC/DCviO6ku3nhsPUYor6x2iKpiJEHZn6plBVUbTidWNXb84+b1GX51KjYNDuMvui/
         ytR5SbbIyxJetHHLhYHvEtAgGNKUqntiJLtJoFDzMFEzXbqjTkUBQstYNtasXAYkAM4M
         arjFdTlHPzbeceser6n33Zd05YxXcO5XPI/n3Mq/aDle4lCaDmKFITN6bg24HYMes021
         qZiA==
X-Forwarded-Encrypted: i=1; AL+hErE9wwEgx6QEFHXYtz9esqA4DEwSXgu/N6RLCDvBAQdy9kUA69zCDeJWrXn34I3dq8iGZZg48SGCsSlMMkJvspFj@lists.infradead.org
X-Gm-Message-State: APuU4Z/xEQIVTuyPwIWrtkrq2Sy5uolv6tZLHydfRjNH9SaW/5RXSzO1
	NziZh7kNgVlRC8dhobxwf3QrZNq/F/m8GzTzAv/BHgnFmhtz4ZzciPS1Ghjh4mpjZg==
X-Gm-Gg: AZFdTZcPKGYl5zoVNpqOY7akkq0T38usuAugb5GBJD7PeF3dm+IFBjRy7V7Y/HRw6Kf
	Cmybu2E1YgfeRccqkAIVhgw/hOqiT8o0VJ7PErxAOkAuicVRuZWhcTgIMM3FEJPjsCYchLtSycl
	LYUD7vO81P57g0yfG8REpMAGHcpcslKGn0q65ICCvXEGxWTFxEzWFryOXRTE0EBSDm+p13Q3pKD
	gQyUjg+FN9qe60xLHIe8392oXfKetHby0J8VAKG5Pew+B/N+1pl9S2fM2k0LssKPcOzivUWIDrg
	gxp0JbnzKl7stDWLw8N1nT6xmTocXi0AzfHATJOlQLrxcqDdikX6n3V7yLUIlgm7uxIDSJS+ItF
	4R+9HkKBEl79aW/kKkYm7rXvTvuTahS06UBQhhhBmRDtIVSgv08Ivxz0ogYsMzdkpf4/Xl5IOXL
	FT1kJQYqx+1KlqDEA5RpId5SyTK/ZyL3gNKj364gpwf3KVn1NMz+GlaDMfqqE+7d+6ly4d7tqiW
	3g+3lrX1VmYoh2mKfinB/px9T1MMxhcHT2trZ+jRoh7t7fmHEPfovtJ7cT2OpCIhYOMZoVzKi9z
	pPKgqO+oVwg/IDRHOpCH3ae8cEhcwMaZxS0NmtOKg2HSmEDn8ngeCESrNPCSJINZCYPxZs5D9mr
	9uZwEOJa8VHruv8x6Ww==
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr11103689eec.21.1795692177950;
        Thu, 26 Nov 2026 03:22:57 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm70620666eec.26.2026.11.26.03.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:22:57 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: alex.cramt@gmail.com
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mahesh Rao <mahesh.rao@altera.com>,
	Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: socfpga: agilex5: add support for Terasic DE25-Nano
Date: Thu, 26 Nov 2026 18:22:53 +0700
Message-ID: <20261126112253.365806-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
References: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_032301_223736_9AFEF508 
X-CRM114-Status: UNSURE (   6.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on a DE25-Nano on v7.4-rc4 with socfpga for-next: boot from
microSD, Ethernet, the HPS LED, I2C1 with the LIS2DW12, and the service
layer interrupt (hwmon readings).

Tested-by: James Clark <jjc@jclark.com>

