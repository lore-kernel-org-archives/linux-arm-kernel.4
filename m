Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD2C606A889
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sPbXDP7Y;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=H04eDBAC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=; b=sPbXDP7YpeQN/n
	LZwmqm2VO3k9ri63vjT0HLoXnqOyrPBw3ZemCq9lKPEvWXiZppXhM3wXwyH8QGjzYs7fNI7n5v5/f
	3gQ+nXqVGalzgkkyGWr1wHQ+4/3f0Cugm6v/ZasG9z/EZqTpLOADMTByZdkU1qxYYllumXNRVF8VR
	3zGAbSX9ShdAVO6toWI6h4ZpEkA+W4qUIYRcEoZxEgeqWQtz0XUD2kd1v5wER5xP8CnAPLj11tT/L
	awm0ccTfhpK67uoHEKDhsZLGyGdgKCg5xXth2EKgyfLwT58p7N9qIq2YO82I6Pf8R8NSGa33ce2Ps
	MsWqnAr8boKabWMjiwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6g-0000000CSwD-2jNG;
	Fri, 13 Nov 2026 11:06:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6b-0000000CSqw-1Q7g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:06:06 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a214af2076so4934035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567963; x=1795172763; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=;
        b=H04eDBACE5koyMkH8vxkHYlu8NVlsLAlDtS3ZlG8K52tnUciblGbx8N2U8XPF2a0PQ
         Mt5PAbRzufDsGDgHYUK5eVYeVVQLFIj9mGnQnxhaQ4KZK/kR5K7nslCpzTBNny7oOxlw
         oWfgVozxXDx413A+gmoWUVgxUWydmPFUYePbOccC8qkub8uF5LisNmFkVbYPApwVfhAn
         xW7x6FWRbRW4wIf6grqlXZxGqAPzGmkLAZUGVopgfkC0MgMyAz6FZh4WpoNrdzuXDW4j
         YYii6c/ETbf8MaOFqlJjRx9LaEbZK98Lfv9ihZJhms1vsSUx/3WBwbFjhPpZTYyCFvAa
         5ELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567963; x=1795172763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=;
        b=ddnk6KACZaquV55WEoqIYGDm0SDQFwdXWhl8wChBflvbU19Nj4dLOr+/bDovOvLJF6
         aEkaQnzH/lSxavrmy7hPtR+mLj0NHelgq3FK5xgy56UC06WRAHDewKM+3i2L02/nNJLr
         Gx9hUVdQC0lO9muwwBUpq1ovzbwmyw/UmoGh42SxsnoZ/sOxXy0cSNR1szS7M36Ya09s
         bODUE1vM0Z2NQG1u/b5z3HO7lI2N7j+5wiI+I0TosQq5q44PXGv+YufKuIOjSQRMHXZ8
         MrP1/oteH7kM8+KOImAH+L7dMnNGY9PYG8awiXNISsxUDgYFIWa+n1FkB+ZKBqRVKH0g
         brmQ==
X-Forwarded-Encrypted: i=1; AL+hErGgPCFAgIxdmM9r4blqE5+YWDBEsP/aS7RhjiazeIbtcorrwugfWK3hnYnf1olOEXLTMM+XwZY4+Vf+DbnRdgZ6@lists.infradead.org
X-Gm-Message-State: APuU4Z/7EZf9bnudOHzmbhMAvMFyqNv/BvYN3io/7SLN/PGRK0m2xfEf
	zBT2Ymizcwr1yvw86F0RVWdjHIf3+7Ao6h79oZ1d9/hwedabZTFRpWfFOgkybCqqgsA=
X-Gm-Gg: AYBFou1/vve2PM1b+/8M14Et+C5CTMrLdqIuccwzSXUtNVNWwSztPpYvTt2vJFSTsDt
	tUtE/R/VWXA5xazc7UbdmmaxMxAkxQZFKBBbhw9Wn3pz0r8i11zd47zfdNzdNK9D2KdAl2jPNLZ
	q8wmEOzZR6+naux5IDZTMUebhTbVxonCfIJyToi8GV4s+pIRka3sjAGWzb3wspp2bffw5GtbW8x
	e8d4xECV68wdeFTKPTI8Honr+klnPTWJdc6Z/axeIsD2jTo3nlhjcNF3LRj9D0Tg9Wohjp6DXaK
	G2Si2F/eIzq8aYqfO5j765i2s2tqT0quSHrEwE1i+soflc1I7ySy9BByyUSjj0DIwR4SS90AP64
	AJs3lD4DxXzKQuvg/FF8LxCjo/F8zpsAp1+V2tuiNJS5w60K634UX7nclIDStMjaJ/5MMrnbLVM
	aJL8VJtGhk0gtPx2qCf6Wub6NgwjM3ZVuYZ5ilvtkfDy/mf8mUYVgAMt+uHCF/m8T12JbnHnauY
	muizaAhPnP3C5y6c/W106bwR6E+SXQO2BWRWGjlk+DSLapW3gZFm9mkB12iONqKxtwfCeUxLKfv
	oGnMKWtECt4TPvcCky/OPOxXAaPYcqJ1h6OvF4rqXxHomZqtKcw=
X-Received: by 2002:a7b:c00d:0:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb55a8a57dmr30894835e9.35.1794567963242;
        Fri, 13 Nov 2026 03:06:03 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm7329785e9.12.2026.11.13.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:02 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:29 +0100
Subject: [PATCH v2 03/11] pinctrl: scmi: send the settings without argument
 as enabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-3-faccb4685d88@baylibre.com>
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
X-CRM114-CacheID: sfid-20261113_030605_391891_BDB3D8F3 
X-CRM114-Status: UNSURE (   9.63  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
drive-open-source and drive-push-pull take no argument in Linux, so
they were sent with the value 0, which the protocol reads as disabled.
Send 1.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index cbe4f3b6368f..221dd8d30009 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -172,6 +172,21 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }
 
+static bool pinctrl_scmi_pinconf_arg_ignored(enum pin_config_param param)
+{
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 					     enum scmi_pinctrl_conf_type *type,
 					     u32 *arg)
@@ -181,6 +196,9 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		return 0;
 	}
 
+	if (pinctrl_scmi_pinconf_arg_ignored(param))
+		*arg = 1;
+
 	if (param == PIN_CONFIG_DRIVE_STRENGTH)
 		*arg *= MILLI;
 

-- 
2.56.1


