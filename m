Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319FE606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zck34g4q;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y/IrLA/M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=; b=zck34g4qim60vK
	CiGhf6VB54tZn94PQKIKQcsAK6vKSenlaWl81+ytbcrEAM7SkDqlOueTqigqnRQ2QEHkXs7L0zkuW
	LGMCoIItk2fCPWqqYB/cKMcOFcpZC+/1tvxIETTHjpWQENasOG8Z31jR5ZdZztJ/xc5gpaINLm4BC
	IJfTtKK1aergm3CoP0YnbZUYplMGHw3Ks86FVEiKm0qCJWioU6n2S9XtyEEVQKPe0t9+0Hf1YJ8WY
	uuDoJyLyb8QbXpoR8NZN3dXfAnbBx9GWtr/MQW21ui4YfmHzBq1YMFa4NpqyEVRvwwSFZHyU7LblT
	298c+ISIRuCLCgMXtTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6i-0000000CSyk-1suN;
	Fri, 13 Nov 2026 11:06:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6d-0000000CSsC-32gw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:06:09 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3801115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567966; x=1795172766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=;
        b=Y/IrLA/MyzI9d9cXbFgmPp7mDcBYQAZOIHvEr4EVjDou7DJXeu+169kRJnDL6CECFw
         1psKRba4PrkylCn1hWiCRnM48haAfKUflNmE2+m6HFABoWCzGQT34H7ysKZ3FB+ru9DM
         0w5PfEzObabg1oRWnzoa+iL3LPq9m4PoSOaBQanTp364nLoHmKMyKftY0AxNqEPzJkOQ
         E5ptEbfkjZ6dYVUzPs+7PETQ7wDTxrqrE+mSagZXIl9kjdQzjizlPRiJsLvfY0+12njo
         bEoQ+mXUZFP4rebOdjFGDG2cHNtC0Ra5W0w5ASKZ7tb0RpZhyGI16I2yWGx+BilRSKXe
         5CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567966; x=1795172766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=;
        b=lztEGvAZmi+/b8K8nCDKWuA9udyZFmv1SbWU/9qOPj8S66gvtfu6YnOm5nimevC7YD
         nMrm7cSU26oxgzdeGRJltKe9NcxTECOp4gSgwucDTtso2Iz51WUtDH/s8o04uWnEP9dV
         A1f7qgrdrH64kIZX97ihSWP3mhkVThAJrQBXsLndDPuuyRl26BXGF/vN2PgLxAS4rufd
         TF7WXm9kNbO1qJi2SaRJ3Yjfh1ORIZhHlxvmRWLxar/gUoPfL0myoAPVtWFXbQE7peAN
         P9dr4hjZMGzIz7l9Of4Q9bw2U8DWst0sGoHgRgjUbpHe96HPnzpdTrFobbg9ycC3+ZF1
         /2lg==
X-Forwarded-Encrypted: i=1; AL+hErEbsfe0z1UqG78UCnJwC7tp5T+VaaJYzCwx2sYXfpZkoUl3vnX3LL/40pYJyRBrnIoYiRgN7s57VhE3YApns5x0@lists.infradead.org
X-Gm-Message-State: APuU4Z92t24QQ8jO5QjuMkpMkPF+RSoXPfY4o869O5XUc7K//P6c6J0N
	tb+8sV0idQI17eNXFxb4DblUSblZQ31ggZa2ajQN4vp4B3TAXpbdisKvySFQ6GoyDMY=
X-Gm-Gg: AYBFou1DpVf4rW/0VnO1ZUF6FBTQ83/1bmbZrC85r8ZEwU8EenjKi+DF9pL/JUWs/vA
	SurFyGlhStuOBIPkWJnj3YWi0gOQnHrkVv1e4EGIg/9zwhoIhTZiQMBsKtLZVZDhFYmRikcgKzm
	peew5yPLuOkukjnCQp6ftnJIFF4TCNGA2QYG4/CBRFGtymP1X2uog2ffK7Q4Vxz8vTXT36iS5PK
	RneBRo+s4lkhEYGoSZY1u0WbQ7AauVYpcAHF9UQrp6/0EXV7e2k2AKEpEhGmwD645ab8v142JBt
	iZVWQsA+m+KYAWP5lQfjwWgB5z4KYjGWrg31BpyqO6o2RXLA/gibPJGjLxK/HSCNY4zggtsUf9E
	tciflgmc9wtjTDqFkf2CilbVdE4IR9BO/5Btfd+DTEQ7S4rFwShweH7bcv6ZKIGCFteQavT2j1N
	vyyTYvf7A04cXEpv0ymrhHiBWeRDfyRJy3Ai7bTVOR8loAMnshK6ecbieUXdgifvaQGXZaP2Arf
	VEJGJF9NfEUlO/Md74gZhQ14ARP5SxNpoF86G/Pfuj+OnFzd07Cawxd2Di973ppQ2sSEJNjKAfk
	NoAmamIm4K9PyJljjpXZHhVNFWYv/VRjpvzlXbSOxMSMdnrrlj8=
X-Received: by 2002:a05:600c:3b16:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb55ab4493mr46428875e9.35.1794567965726;
        Fri, 13 Nov 2026 03:06:05 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2969e7sm128332475e9.10.2026.11.13.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:05 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:31 +0100
Subject: [PATCH v2 05/11] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-5-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030607_810244_B19AF110 
X-CRM114-Status: GOOD (  10.58  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Return an error instead.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm/scmi/pinctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm/scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
index 18761ffbf893..b071d31b5c33 100644
--- a/drivers/firmware/arm/scmi/pinctrl.c
+++ b/drivers/firmware/arm/scmi/pinctrl.c
@@ -265,6 +265,9 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
 	st->num_returned = RETURNED(r->flags);
 	st->num_remaining = REMAINING(r->flags);
 
+	if (st->rx_len < sizeof(*r) + sizeof(r->array[0]) * st->num_returned)
+		return -EINVAL;
+
 	return 0;
 }
 

-- 
2.56.1


