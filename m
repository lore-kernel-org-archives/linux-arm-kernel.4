Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A3F606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WRgfHEel;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRQGDHdt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ka7y97kjrP1N5aLm53cFojAaC0fJOtAirjVuWEljQwo=; b=WRgfHEelwuDqwIwXFvLIAxYyAw
	jMP7GPAwihnEc/aTpdzu+h8KFq7ZC8XB5SqAZKnJSg5q0AUePMbb8hbMd0/S9TZiwYcLBXxTlUY9h
	gCQJPoefuMHyG0QIlLMP4xValzMyqP1GyY4L2/62EqOK4QtV+ZB9PvS8wgqX2lSIBTJq2uItLk1lf
	OO9txUkgFQzJMv0ZsFCFVzz5FxF5aBd1b5GTlycxPAXVbYcU6bzmJ3pw+v39x6XWfrvf+Ro4twbkE
	pIoakXUPxZzXt43Om/TWHCbIcIyz9LgQAZlAGtpIiqfaR7GMExM9xG6isEu3qRcq8DmRFPdUIDCG+
	jpzGwKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMzD-00000006ZGE-3Ke3;
	Tue, 17 Nov 2026 17:28:51 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMzA-00000006ZCz-1JUA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:28:50 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso1048318fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936527; x=1795541327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ka7y97kjrP1N5aLm53cFojAaC0fJOtAirjVuWEljQwo=;
        b=jRQGDHdtaWWpHD+0lyBf4L21BvUIt6JqWSrhJPij674kkKGE3Gz5Bd4sWcLonXp/iI
         N3sPQ4ppbFKrOPAMeVdO4iikl2BhnUgHaEzkb0YWL2KWpHu/0eDkTj0Q1ZFiLbHJS1yk
         I4HLQFCwoqitabk8NX+4zF85O/Hbyghm3P6QVLlAYkMkIyCNJmZgijJ5LBug2ShfI0uH
         xqYaEpiyMVSpaYp1eTBkWDVcHspaBAvGX95CZXCd4YKmClik8tG1JXn+2+QXtZq3AH+k
         ZTGEM168sHB+hPLYp6sj+3NysxmcfJwuCWwe9ZGZCcRa5jFbss42EZzrBqJHUlqhol15
         K56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936527; x=1795541327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ka7y97kjrP1N5aLm53cFojAaC0fJOtAirjVuWEljQwo=;
        b=l/yIoYbrE3M/frTsBs0avwVHj+AjryMAWXSzXZObDyhBQg2zxEEu2eNfnl3A9DHtiE
         bgtC0VQTianBpPL+q55soPQ0r3sLWGR3EepYvK/f/0e60ku+WLmK2MLUPdCSEIMqCwto
         XxOfw8AVSkqIZMo0Qb4Qaj1c0E8B/Ch03LB+etFfD0Hlngqugq5Pi20BBvBXhasM7EsN
         +rpzaLApZNK2nIn1KlwsqdSLejLV92004fShm5Nq8txGQ1aBX/LtnaliGyWuoWccONg1
         2SbXKCuLT2LIbjV8/yp76MBj9LUgKNj0I4UpfakhOYrVjX8mWVlBf+KamL2LGIcAYu7A
         5QzQ==
X-Forwarded-Encrypted: i=1; AL+hErEdw1lxpH28Nl0A8APMTonm5rHEjiHBUx3OIBRWChjO5lt8v6l/rmhteu3zcOpL11tKcefMc6QhPkiAygQddLOc@lists.infradead.org
X-Gm-Message-State: APuU4Z+5nb/MTsd51srLW8+htGFtlt/ThlRstEvotC+Ibld9yLbftWil
	rd9TGfU0BIEgxEErqacCmvcOSbbLK5sQInt0P5Uh4dbewdaqVsOeZtOr
X-Gm-Gg: AYBFou1BE4HF2H/tzGrugNiXAFRLwSsAyHvWNloiewQI6V/TsVueUP5ncyoohj6mZlK
	wisX5c9Br6KAww/RvWDVWTbmoPBqfRW7BkTktRzPF/SyX7XHIxITLBpgf4g0uZGyX9RaQVHL+fR
	5ace+aMnN4TRFl8i1sqDeMjrrW19PR3GF073LU72WvBJO3l1tBe5zT44NnWif0xIhQvZYQXesCy
	vfQ77Zc8q6LcRypJJx9PFyMORHOKz/ZN/6n9A3+WJYwlTeY7yuQxENmtLlFNUnxQZOnmolVWbkr
	7HgkNh69bMPngyDgBU9Jy33G2qwU98RBartqc4ldcc5a/lYIL9+OivVdU6RslY2vEaOSgAIwqDA
	ACObkpy7tU3cjzusmfM0WvFb5cM0wlARihJwEM4vtgrimJaAG9xSZ4i6aMqH1O021xyPt/euS26
	2o20/7J5kQmQAK7xDjc/3gYMcQfcPJ/TMlg/Hrsuz5dtxq29goElynp31LV8fkV2gs3lKnDgZj7
	bdMWrLjL+TXbvQcHgBMy82CkKln7DOgv+Ov4NYBwerl3O3Cb9oIP4b93oT+pWkgKAUsrsXpy4wj
	8sgKmACFWp0F1uyjBbMrGKzkkW9k3Q==
X-Received: by 2002:a05:6870:32ce:b0:4a7:1d64:2695 with SMTP id 586e51a60fabf-4b415e97967mr2027034fac.43.1794936526492;
        Tue, 17 Nov 2026 09:28:46 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70d5b1c64sm148358fac.14.2026.11.17.09.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:28:45 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	david@ixit.cz,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 0/2] Add rockchip-timer for RK356X
Date: Tue, 17 Nov 2026 11:28:40 -0600
Message-ID: <20261117172842.65346-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_092848_366461_B949AC15 
X-CRM114-Status: GOOD (  11.47  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chris Morgan <macromorgan@hotmail.com>

Add the rockchip-timer to the RK356x SoC. The timer for the RK356x is
register compatible with the rk3288. Address range taken from BSP
device tree and confirmed with rk3568 technical reference manual.

Changes Since V1:
 - Added additional missing maintainers that I forgot to send to for
   V1.

Chris Morgan (2):
  dt-bindings: timer: rockchip: Add rk3568 compatible
  arm64: dts: rockchip: Add timer node for rk356x

 .../devicetree/bindings/timer/rockchip,rk-timer.yaml      | 1 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi             | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.53.0


