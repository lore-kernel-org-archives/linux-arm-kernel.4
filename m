Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78C1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jvOXTm77;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=ofsrBabs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=; b=jvOXTm77rvjMzp
	Env0v5FgwytTFs9mez/j54LWOeJ+pZedEajkuqUnx0/OZo9nwuyYauQ+I8yDJ3TqUwKPgDj+rBG3a
	nJ0fteOfetnZI5ge7rCWz/17TTFcPieavtLXC5s+tWm0MgpFIAVZFKOi5/bqceAkrR+KbeFTPb8L4
	M6xm/MR0XWj7nymeecsOD4qSSj9+Z9N/T3GC4KCDjspCqR6S9Y4skD10sYVZJzmh58ZCy3UD16yo9
	NpmOohpIcU3WgUraOrf4SZuzheGv3AT/RjK3+ahKWfLB79PV6B/CfdHVVWWUSMsvrUWgJ5Rmyb1J4
	1KCLJ80Yw/VjDhbYwtFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbfT-00000008I35-1I4k;
	Wed, 18 Nov 2026 09:09:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbfR-00000008I1u-0Re9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:09:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso4812245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794992963; x=1795597763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=ofsrBabsKv7hlU9nxBov1Bq21diLrAM5nDyDQJalX+XvwJlU+QXmNKkCJ0WDqH4UY6
         ZD5JOAeyHR6WsiHThnUHxm73zGJF/y+9Q5FDKRS51GDNb0APoNz+YDbFHFTY88EN9SP6
         QRxdf9Kz87z/GHn1JtXHOz74kmtoiEno5RsO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992963; x=1795597763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=HuDhyrFstIO4Y3vJh+b9KOlRGI9GPmThCz2+8xWvOF4W2iOgQIWgTThcIxY7wixF7u
         4AhDoyswgzAQm7Y6svcoZ7CTtR6ootBFJbTxQnrPuRUiflYMuL2HudIgBNclS540Zr/x
         GRTM2l7PQwnlSdoLq0QNHhAXFHXZzR+qZEuAxZ/srZxzAHCwjxtFyYGiOg1RqYSa+W1r
         WMRN55U/6hDOqSBTurPa54NLfF9jVdhACokhuLZY3G5LOYV2JRtsfKYUx3fQi+Z6FDcm
         OFhPq3vsRmypTxMdwhI92WoS8SGhm5w+bqdoiysWEkZkgGqSWinFSlekGyCaJIaAV4r2
         VJ0A==
X-Forwarded-Encrypted: i=1; AL+hErEa0PgQwiyuLL5D2pBiQTbcGKrwAi68C9qcv8n0k0FCuiIIk2mjGECVxuAZ8tQ7XnL34W0+31kN/SzKg0BrTl+y@lists.infradead.org
X-Gm-Message-State: APuU4Z/iL2U9VmUZX0+hvyWBo8V68loxRhmOTrMnN/SHQFvv9litc/sO
	Xhw7PAgrOI+PUXygkmFqkckaHt2qojOH6OV+Dgif2hzcJAPXPgz7WmQFoQWdWbIaozg=
X-Gm-Gg: AYBFou1sjuDgeMiG59RG8/aMHYfqTbu76fDqLeT+maCr+c5WwHHhgxbGY+WlbkdXwVo
	5115rmspoCxqIO7o1ZHt9n9C9YTYukq+KC6P/sEGROsFxN/cur5w9YIRjEQlgh5NYwM3yobqd8Y
	h8ohWoiSKPSWq2Qlcc/ELtk17ugj67pSaxKdEa5k6RTT/tve1CNwZF6EcnvI7E41K/bktDDrhpQ
	yW3zHr9Iq7/1YL0HgHyEr7awSWbuYal8Atf9TvqMPCInD3KGInH7jMqkPV/sDymAcnDUiUcThu9
	FyAfEXwhXcwqwkbyzhYLf/L6oxBD218DnViPh/L7Oa+jFSaK4Ro2mrSggW8BIltDabW3J8mzE0R
	QkF2dKj+w+8bzDFd9q4FtyYawmWteeD2w0qAM9rvMITxhteVkxQjYMG4RTftJ1Tq78A8rfijqyZ
	ohtI8Rf6ZEzmIw+cW/+naH8Ytd3D4pH7nCG7svcdYWeQZ1rMutQ25v1kwIy60NDvLYEhditsEzi
	MuRkwbF6ptpLzXa71zY3sntdhTwcLbXmal9wponFAlgHZuNkRTYFNGJlFtbUmjG7prqCg19x4/f
	wTbi9beIUQ3e/cYMoDd0TTGelqjYBdxQCcaAaqhkHcB6tk4=
X-Received: by 2002:a05:600c:3b8b:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb7da1b581mr45003055e9.13.1794992963264;
        Wed, 18 Nov 2026 01:09:23 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm185770195e9.8.2026.11.18.01.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:09:22 -0800 (PST)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Wed, 18 Nov 2026 11:09:11 +0200
Message-ID: <20261118090914.38082-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118090914.38082-1-petko.manolov@konsulko.com>
References: <20261118090914.38082-1-petko.manolov@konsulko.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_010925_158668_2F7F17BD 
X-CRM114-Status: GOOD (  10.25  )
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

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3


