Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6C0606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l/u8RqOA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1ZqQMFH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=; b=l/u8RqOAfP82fq
	Bh5PjxWArjvDtA7KD2gGyzAloW3vT4DkqDVDKhio9X+6QJMEXvQLWfQb2g+rkgO4sXYP2Qyg8W4Cf
	LdB/PFmZceMyJVVm1p/tPrvxa67N1GXlcRgXZg7ogEVzyfFI97ZLJlGcxi3CrrcCZTKy89ghi2Pz0
	oIG2IZoyjp6WoXlUosi6lGycQl+tvtVn3SRUGm6ZM24aeZujxwEqQ8DhAfakApTjTwYy/YYvHDp68
	W0TMvHdtF5F8dlvuDl1DkXmI6Hker0QKUaabi21ydihCzftDtenUxenBhcNfzXBm/K/x711mvPr/4
	x0iUCN0q6YkWplEjn/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvJ-0000000BFWS-0Qlg;
	Thu, 19 Nov 2026 08:55:17 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvG-0000000BFVW-3RQ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:16 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-55d2b4a99d4so17695021cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078513; x=1795683313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=K1ZqQMFHnQmE1T1IqHbYNtgd5Fb+T9keIrMn80f3Kd4FOI/Jex+7cxoyWpq39Fx1Ix
         6sUqc0b3rHNq9f20c3Ri+fXlnkyWxRXxu36NlghkqlL38r1LXuWgWV7ayJfrsEHD6dTw
         V3Z5dDoIfnZMUF7z8a6yoTt05cfT6fSTjtsS1QE3SPD2ZabTpbXRPgLx6qv7ngoXLix+
         QZaTH3zEblW4FMTNF+7BRQ6BkbqlTA+Kh+c+Nn9gBfzzqI2uth1KPA0vRQoDKShViPxA
         aJggiWQe/5YHz4lTDtOd/MDWLb8zXeOQtmFxsJx2yPeb4MQC9p1VesoHaXSWDZFTMDVq
         L+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078513; x=1795683313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=js8bPlcaN9a0TWry8Zxivc1c0ZvfRf33r6DKPUUQm9YssuJkh/DJxXu+kFR1fCOZSi
         UC1arZgq/SyZ+k9t3PNBeUS4r27w5SI4VAKp2XHGOZSCfyJn/fhclmywPlp8vnJG+nIq
         O4TqNxoRcdLMf8dpshxEdJLsW8dp72wPgoGB/JqhgeRYLr0MSgpP9lwSFeBOg70vye3i
         yYSJGd1VFOhW1ricDc/eMDDEk0xAPUSf5KaRD3n+dkIdTvu/cKhHHZ69ds1Y28T+Z6LU
         yU6Tk9NzV7P3gwWVkSqWhfW9EoT1c4hWwa4tqcoPt9s3d76TgvC0Fv0fEwAsHNL91GH3
         rSXg==
X-Forwarded-Encrypted: i=1; AL+hErGZDyDbRrOxSs2nEUVTa0hMtDAzDsYSt1pDFjm4rEnVBQM5QX9xUtl1vEPCUZpQhMknq5+zwMsdk9GoB3kN5Z9D@lists.infradead.org
X-Gm-Message-State: APuU4Z/o+p5SnNBmrRhPlHvNXO2A53Q9Ipa5yvKIZy7mWDDpbaYXK8iM
	py7MUOUui+exxXIALuBGTVMOYIdcNHHSYjJ/zHzpDdmdoFHwPKysFiyn
X-Gm-Gg: AYBFou0Cz7AwFKAzWpODn7csgUvWPEuyzLGJkCdLdyYBHY6Km2yelOt2hRLt2VeAcrE
	BjpYju9GArbPrTOtZowQzc2ZuiYxGn0Cc9r00TLSIBPWT+6J4+cHSPnTJus/0NDGpM8MV31XOFX
	PQuPHT30x/ALtwmpdFILGbMfy7qzA05IWdPKZrCC975XyDBi9uKqyPODzj+csyk9+edVh5NT//7
	UKauJyrffoos7djiZnOMRXzPXEd7j9etLo8Iwz/rbdG6i8yKLXFO8Jq1yho6Za0eGbodsJdrJg7
	nMMoYxVCFY6x3lbTqG3HC/ltPQqKxOq0+NG+gflX6dTDyzhncChaOCzJLE6uc8NfC3aWbLhtRR8
	4uj2RFaVQJxrgRyWHnjABd+MPPAsl0Vrf0gUcWJb5djv5MVSKbN6Y6F6LYa2kRjq2dhYTnYIyLd
	Hg28MddODWA/vMiptqk6QWEA0nn2L8Heb0AaljJ5HE1tGqoh93UECtEcjUJfcR0rxh/wNSR9P/I
	ISKcq9WKtX2Is7esuB1MXcJ/4sRZMQx0//ylp55gUSENmk9VXAw50lM3Xo23Y3l2wMvUrxihT11
	JDu7arXzfwzIopgbDKPE5lYxjfHZqRhrH6g+WN9cyGM+UYFF5f0AbcxIuM3Pyj/T3+ldLyp5/l+
	VZH54nqm+Glrw4SmLobxEIK3O7XVwKC4+EClPOfOzvlF+cSszFxAfeEY2jPfmtmfz+UhJQyNjVm
	ttpA==
X-Received: by 2002:a05:622a:550:b0:55c:b6e8:bb92 with SMTP id d75a77b69052e-55d5a67f8femr84858911cf.61.1795078513647;
        Thu, 19 Nov 2026 00:55:13 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:12 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 01/22] ARM: dts: BCM5301X: AC56U: specify switch
Date: Thu, 19 Nov 2026 00:54:31 -0800
Message-ID: <20261119085452.75708-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005514_863876_6C864D6E 
X-CRM114-Status: UNSURE (   9.31  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add labels to clarify which port is what.

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index 708599f8c4be..574fc4f76e75 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -106,3 +106,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1


