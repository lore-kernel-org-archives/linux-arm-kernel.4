Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A49606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LOEiizb1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BkLwLZFQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ATe77EWktA64DVb1MltUDHzbzMHCrNXC/lvyw7f7T6U=; b=LOEiizb1FP3ObU
	XtiqoSiV72eHplyytmM82ygysa9ZIDdCAzPjelUWSk3WfvOXqnhg01IAWnvbRT3RQKu0Uq8qg6Ub9
	Y3q+akPARUykkiRxrNGIglysibtlz2um2hDzLumMI3peisio4kJ4CaoWc4tuxmN4g9SbBzFB0xWnV
	pVp8DLbGpH4IdUd9uHhfbVMnESFSiUcHoHfxXqxrd4eruqxCLv/xckNKhx6/PnoAnW4UtlcwHhlRO
	Jh4vW87GzFwTMqsEG774HN8ZMEPtBvY+dlYDm2n/fae4UVAiedZlATbAT3LnRMJa74172rjpsCjj5
	y8ZqRRG1zJa/4hqM552g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPOH-0000000BvEf-2xDh;
	Thu, 26 Nov 2026 02:39:17 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPO7-0000000BvAS-1sOZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:39:08 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so2629481b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660746; x=1796265546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATe77EWktA64DVb1MltUDHzbzMHCrNXC/lvyw7f7T6U=;
        b=BkLwLZFQ8nLvz+9M2zS+JjdWEMzDg4F+6RAwzH5hQ1RlOiIoyTPYBOjp79SnsV9/fr
         YjN4MEWMN7696h+4KdNZlqSo4KLPkVU764FV90Hvp2lNMlARofN+q8zwtNQ+EuW9ipg6
         A5YMpHgbibMZFmJdxvnchuqUGzarX4EA430rNLT/zrz+Zi7kff4wRBr8uxp1ZTqalIat
         NnPXAfJfB2t+bf/TIj+Kb7/CgTFBVdhQGA8xlU/6HcnXLqp6JbxGidPfq8nDhTfpqm9a
         tsZyDntdEHKk65wt70CZ3L+jsmPrnL8Gow8lSJcPJR/VDkRQjzgHEXNqejmJ6E1vGjWt
         GYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660746; x=1796265546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATe77EWktA64DVb1MltUDHzbzMHCrNXC/lvyw7f7T6U=;
        b=qMM3H8zelNSwkzwvI4WPhuzh2iQi/tRuQYVvMpkA1YjvoY/kH4LpfvTua6WpDDl63J
         ZqzP481jGDo4MLpSGPHBKd2QFOgs4ajCjcPJpxkfnCbzMfu73vIb/Y++Tln4KFUvlq0D
         NnN7FVLC3zv14/8PzS4nn7rL8OzNyJd9qbRfkhwcRn7UpwQU/Y6SInKfHAJrkpmtI1qm
         dTc9T56UrtsrgPQ0FW5kZrSjNLfWenezgT/ra2tTzCP0L7Mms17r0CnP1K8UVBMmMbVm
         rMeWKdveZMbC6BzMucfvnF6zCZ1Gl5ARcZ/Q3isN42cOBzLEAvXIJRO+THEAwtBUWrR0
         4Jbw==
X-Forwarded-Encrypted: i=1; AL+hErF9c6YVaytsJ9EqQFquU6huqMz0DBSrHrK5xcA1dZqexjFSWIbFTFMk9eo9jSZ0n17WjXcJsPnKvGN0dYzIa7qP@lists.infradead.org
X-Gm-Message-State: APuU4Z+PpZEw5MrkO2bQj4fAvpkDi3dJn46Vm09CS5/5vY78HsQQybQU
	mWYyDuf7WsIo1h4/Z/NYZ4eZ6Dofy32TzGWK/FGuMtvXw1GGuzhe63Hq
X-Gm-Gg: AZFdTZfTgwf9akkCAMLUkCP5noiK+EPQNDQFAdriqtguMnYtgIx8YafAtoYZ1tFTqaV
	59dkqKjNw4TDs+sjq94uRFTXvr1GJT2js3aroan+cQZMoLv/JCosJWkIj9fqpvkTys4Ons/njXK
	pTDNj570yQu0+AuOsp+ElpsW3hAPY306mW/v7QtYtT8KZA5ILR5aIMUGdfWNa+wuY8JK9vuXGv+
	bAugn0rmtmCMNZJZrol186LzMMigH37b5ZAcAzDBPWv7TxuIfE6Y7V2veHhqQka1jBuVX/sgsOZ
	Ep7g0wGxoyX6qP9tOmPAtv9Eu5egOJWSWe2wYPEKGUulTWDqW8AchQ6/bOpWTLvTauW/X90+TvM
	g6i9vdGin8YyMcbFx+HEaakoXbT5vHcofm1/VBnFx7jzn/sAHYyu63c0JRUMoufWfclokau67Sj
	zYQ9ISUy3v+YMFx8cBkcS1/ThLpFZTC5+Nl1ZRauGK4TSGkKjLKk9OrS+2ghmux/Eexfsr89lRt
	9pDMcK7oUOhhdkN5yGD9ojP6cwWQsV7fwAYIB0F/CXK3bdvgZa7kK1cKq69XFO7uymu/Eo0dM3r
	sX0UcGc0OGLPfmswdGMeJjktb84X+IoUCsNzvBRKFw4bW/bbzEsBbj77T6eU82CmYZvqZ4odrOo
	JyYFUUBxdYHgRAgTM48h+hAINuU92oWqIu0x9Tf/upA3Hrse2vGj0fvDQ8hJ3WY9BjtFUaRKnfh
	hmbbADSMbOvLtVPCiCb5tWgGs=
X-Received: by 2002:a05:6a21:6116:b0:3e2:1418:aae8 with SMTP id adf61e73a8af0-4014dd566d2mr20975073637.72.1795660746393;
        Wed, 25 Nov 2026 18:39:06 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:05 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 5/7] ARM: dts: helios4: use disable-wp for the microSD slot
Date: Wed, 25 Nov 2026 18:38:54 -0800
Message-ID: <20261126023856.767961-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183907_493790_F57389BB 
X-CRM114-Status: GOOD (  13.09  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The microSD socket (U3) has no write-protect switch, and no pin is
muxed to the SDHCI WP input: the sd0 group only carries CLK, CMD and
DAT0-3. wp-inverted merely flips the reading of that unconnected input
so the card ends up writable.

Say what the hardware is instead: there is no write-protect line.
disable-wp makes the MMC core skip the WP check altogether, with the
same result for the user.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index f8ac74d7935e..d4ed47ae73c5 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -256,7 +256,7 @@ sdhci@d8000 {
 				pinctrl-names = "default";
 				status = "okay";
 				vmmc-supply = <&reg_3p3v>;
-				wp-inverted;
+				disable-wp;
 			};
 
 			usb3@f0000 {
-- 
2.56.1


