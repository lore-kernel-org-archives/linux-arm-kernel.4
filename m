Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ULE80Fz4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VgoYXAOO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=; b=ULE80Fz4ZJo3AX
	Raeo5xDO0I6TxXy17/RFoMYvAzyfeIUzSFWYlS7x7c0493+IFZea8jxYfNjHz9MvaYp6vgyz4jxVk
	qznenzIFIke86PFhSDSK0IANSbQ/6SbA7C0PnLBAchmc7N5Xnb3TayGvoIX0BOjaLgfZ/eqSx/UJ/
	NbdAg5fjVi7Yg7qsb5J7ftCTwnZOGVZEdK/zFz9SJ0Roq+DROAHE4t2MQaqaQSwWKAVh1okqU9TxP
	YGgHfVOUdf4cnZOAvC3vC/vtmJiXIRcLBjtUUSLJn+Sq8C06M20Qv8DYwYwYzDcCzOMfThMMdwO1G
	RFJbIGdsXfJPz1cUrUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0MH-0000000HN8m-3vvp;
	Fri, 27 Nov 2026 18:07:41 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0M5-0000000HN0v-34ro
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:07:31 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-85c1135c286so6124498a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802849; x=1796407649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=;
        b=VgoYXAOOiVDZoZGVFMsK6zpjyr6clDPnoEyZXmEd3FQj7lapw44wBxISf/gOxIkgOd
         NlrtG8AAT5DDS/UCUCSSoQn+McHA+5dXbAoZ+HDXgIyX4HYnWZoQi9p3M79+1sHgY6QH
         4yVfTao71xZ1dMflYJAWpR+KWa3mZ24IK4LIIqq02ieoZ9vmCNiUbWb+dVUby8cVwQUV
         ywuNY42ZwCrEO8bEhWQQjWZVoeJJBr7lOPEx/GxvSOQ0pEJ7A+bE+3fpdGCfII+KzXtR
         E+NckqMQVerNVwM4xfmfcPw+GNtnAy5lJjFEzHZHq5pqFXzm4SsgDHxhwYxsrhjYm8YR
         ffPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802849; x=1796407649;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6iub5dfPtfYhqcnzYk69opOns13WbIa7n9pOYTKOVw=;
        b=qDFKHz6NhILAx8N4xdMpB4gB1mO7iK2QU+pQLNETUvj2vsOXKM0CRiOxoJ5dVrZFpz
         e0eDBwb7g7nMJ8o+xaUL7+DMSmGCCuzjOltcwQMhiAmEQ51KkKqN2FEW6slWActkYVEm
         6HrBLEM8JfucNQmHTOiXZh28atDCteevhYplIcefKE5HijFFYl8WQ/T2H08T+dAll7R/
         Tqqte22J5FckbkH2t2qrZJSUe7PPSc2qGadYOiuX2VWLD/r/+CDLqoAsQcI2gSHWXxzH
         FDYaw2bkB/Ahr24SIeLXoADBFy7JQxN+T2+WZL7d+32+g5SqWMIYaQOK1RcnvvlAMhFx
         0ssQ==
X-Forwarded-Encrypted: i=1; AL+hErGWGmeGr7dhI8w7PYUwDzKqRlUThNN7W5c7LYi1kdfkKP5VjrA3uPwuWa19iYwKAaU/YYLuQEua91CL/kJBa88P@lists.infradead.org
X-Gm-Message-State: APuU4Z+ueRDeN8z++RqciDvs/lfuWTUx/wqXzvNUYg/DpEjKY/zNq3eE
	DZSS+OsoNlay7R8pIHz0SXLwPcafIN0M0H5lLRYaSPjHEYjKY22tvVJW
X-Gm-Gg: AZFdTZfntuyT8Ys3T2yFvzEfgh5WWF51YUmloXeCaxqzLD+rM2SCnsaFxZ6MrwhJuiM
	o8dbqiQybcxnzGdVab/TctcrVUqqfvQJYLo6j8FqzQfBkeJG2JdS5uy3ZOs1CW4hHGOgIAj/VVx
	ZZeMWhWa1ZJIz2XviJDrrS0kQsdAXa7UYxiQ7eW5muO4ep7XCBDHMvK9nEId4rxYBnI+0sA0yDx
	Y6gomozLm5mbejd7HGAnfi/zvlVx9zPXavtDFjSIVEopkibF07hJ7AjXXUnt8sxWTqb8DeanP+I
	CByBGjfeWlKBMNpGLPHZO5BUDtZlfyAlueblQv/2IqKBvr4X4+pGiIZ93HOVFt3+gH1mPZ3PvPJ
	xEwYMooYf56ml9iKBzHq09ov58fFhsy0Xn5BgeQHwx62HnhpiFEaGeOqij3P3+30ZcjMMYz8QaL
	cXBXs5QBA24M85TRi/KoniU+zSkGn9rx8QWWsUKg8aIX9QhgpFjkESgIdRtp2sEgERWdvFMmryD
	G54wJ+BmxczBrVWNZ4YTzB0R6QnIwElO0aCN4P5/HXCWag7dJkesN0RdUN3DfXf/wLZplxDvUzn
	cLiE46vHRjGBhIl6McifgWzBQ2usVq/9WBQgvKJeqQ55LHkS4UEzi82WvvMevFSr090WIJUU6iM
	GTcwiUA==
X-Received: by 2002:a05:6830:230d:b0:862:9fb5:82a7 with SMTP id 46e09a7af769-86315979712mr26463348a34.21.1795802848575;
        Fri, 27 Nov 2026 10:07:28 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168bdc75sm19369574a34.8.2026.11.27.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:28 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
Date: Fri, 27 Nov 2026 13:07:26 -0500
Message-ID: <20261127-a733-dt-v6-04-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-5@gmail.com> <1jik1ild9n.fsf@starbuckisacylon.baylibre.com> <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_100729_776028_2BD94553 
X-CRM114-Status: UNSURE (   7.03  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Ah, indeed, good catch.

Thanks. v7 uses <&reg_bldo1> for vcc-pk-supply, with a note in the
patch.

On a different point: shall v7 rename osc32k-clk to clock-osc32k, as on
the A7S and A7Z? The schema still accepts the old name (deprecated), and
CHECK_DTBS is clean.

Also, is no-1-8-v on &mmc0 fine with you? It ties to Jernej's question
on 2/5 [1] and your reply [2].

[1] https://lore.kernel.org/r/p3YaXlLJTguQBGnWyMpb1w@gmail.com
[2]
https://lore.kernel.org/r/9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com

Enzo

