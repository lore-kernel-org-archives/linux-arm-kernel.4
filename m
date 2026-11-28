Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC19E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 03:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YllsdMq+;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OChybJEJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Q/OKruXLAn2hfDxhFwrAwBRikQ31x+YeeUeY/2L4yVU=; b=YllsdMq+QV3xFDg10HiT8wSbVK
	exox2JjaRnJy6XGD2vf5/l5pABvRHC6BC17tjoWKYFqGLobpNxJrrXbcaWykU7mK7VhHbSyDc0Z7q
	i4otKHdggrec7IQ1VfSrdhXrydJj22Pp411NCtMQ54Y0yubzk/2TCseTTLbZg4701VTUrEhjcG2kY
	G6BKfaB0fb9IvyWdsXDLIkT8SPLNcgDl1jMTRUZAe4oVJtG668dR1opj8Cog3f3ebI+22PDVvyjv6
	WbPcdlUlaNohuwqwfMCNI2IMBMi78VHSXgmWVpDm9xGCf+z2o7LEtZBajTuP4eJwszITJkGKgD9EJ
	H66hBpgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX8Y8-00000000JxG-1dIn;
	Sat, 28 Nov 2026 02:52:28 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX8Y4-00000000Jw8-22Ek
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 02:52:26 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so3712585a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 18:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834342; x=1796439142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q/OKruXLAn2hfDxhFwrAwBRikQ31x+YeeUeY/2L4yVU=;
        b=OChybJEJqBZquyw2Ge8h4Y5jYkgzACMZY42QHM3Iv4DjDOGXJyrXnE/8IrJYwRLORN
         ke2VAXef/+WBv4GDxwjcI9D3L2QyaVJSpfZHyCA930K0mB7zs308sRqFQA3WjZJdMQOV
         JEcvVjRd5nrzs6iePl/gwt38a0s9ow/rxSLcC1LluOzFMo6FsVzgClPn2t+SZPPQWxlt
         g5BnjU0n0kSmb+WtdYymsT3/L6Zu7sklPT0/Jkjio8kAOylf+kMSRi7EMsT8nCVD7Ztm
         3UvkZ0x1te4zCKMqUFtz/TBayuWQSEXq0jNuzAeVYEKfPpScm31QVq0y4PTUzjAh8/jQ
         lLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834342; x=1796439142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/OKruXLAn2hfDxhFwrAwBRikQ31x+YeeUeY/2L4yVU=;
        b=qRDBy7Lww78IF7XmImjlrFlUwqhCdKgRc9p9uQw/GNKv4gPzH5+bOwyBLzJ3mRiJGY
         c5iEGf27OLaWG6bRv+ybtxi8XDAkeo5jWHZ0aM5BJZN0qHsIEUqhOsogo53wPVcspP/d
         z+uxHrTzqjrXxKOc+2PRkhg1J5pACb8Zjr4yd2KBLcjs37XD+K545TvwxCuXz6g/NlHt
         9hoFtkXHQVnJzxFdV/7Hsg8/0Z1ph5xy7ji7ksuPx6HWCDYACu83df1U3+m2IVfK3JAK
         LXeI6fiIj8lRqARGo+pXRrcZouEYi0NonQjb8j/VHHxBQnd6rq2zUhZtClU+aOSJJXU9
         fpKw==
X-Forwarded-Encrypted: i=1; AL+hErHF2/1qW0NRDWAE7DiB31hkOfx+ikWTMYZSpkovlIHuE2pIq9zmnsJNmj9TwSal+WmmDd8D9ep9U1yglNyhzgc6@lists.infradead.org
X-Gm-Message-State: APuU4Z+MYlbh84iCEMQRNEmipIX/HGPYFY86JLhwOFDsbOiQAjTpb0fd
	4/rM0BlRCAZNRXhj9LJH6YXxQhETEpgthROoRBjzG4GdgKLNK6jSnoAZNj/5t/gFWO4=
X-Gm-Gg: AZFdTZeNvVU3JDQU9QwPr1Gerv5Q+TVTPE6qvkzJTjm2Qm+G+5URpk0asFln9Uk/onV
	/Ah/PMI8fGbv8Tsb+Eq969Z7y1jpA2wS1YLuAboMwypN9PkQ5eAW/Ta3uWoVkt7yoGl22xjtc5T
	seF3glbifTIKGWYwXFQIDyputiLYJwtjgE3g7+d4XjdVsxXDUEJthpB6Lyudz509f1Jwr1Ua+Ba
	mmhwhskzONBugHh4RHYtbT6oPEpBTRnNKPsRgDvAIsIHpbqWHQMkyQ1IZn9U8N7/9d+M/hGJq7B
	SDHo003ABnwxtGac3GkR0/KxvlNzKw6FNw3HnNHALiFovakwd4t7XHyHQIddzAIyoVTlnNTWD/O
	7rsJH7MtG+a8vHApKHfWTIBaqqcUXDIencECUBgQqL8CAEQ8I9GLX77JaE2ndKXkzOBr3OrePaU
	uw0lSJ2vygFeygfWFl4SdeAf7WR4by2Om1IkopCUrVcIH8QRDdGhKrenaS++iGAoLQHofa4UGZQ
	GVIjzXwSSa975Ilh9hl9P1DTJ2L5vInRwDAPmDdh74jxPZonuXSVW/s913BcQgx9Izs4Fa6HOpQ
	ojUvJIS2yI3mIp6ikqP4VYDLOao1r9S5Ch1YhboWabUFtfI0scu84ujPDpHeYgTssf8LHoRAhYk
	u/ZkgrEjQcEesYA==
X-Received: by 2002:a17:90b:3c11:b0:3b4:f92:adec with SMTP id 98e67ed59e1d1-3b41cb20ec3mr25787093a91.56.1795834342067;
        Fri, 27 Nov 2026 18:52:22 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492174a91.17.2026.11.27.18.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:21 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	devicetree@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH 0/2] ARM: dts: nuvoton: npcm7xx: Fix PECI reg offset and wire watchdog sysgcr
Date: Sat, 28 Nov 2026 02:52:17 +0000
Message-ID: <20261128025219.2679805-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_185224_686833_AF3C0DE9 
X-CRM114-Status: UNSURE (   8.12  )
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
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two fixes for nuvoton-common-npcm7xx.dtsi found while bringing up Linux
7.3 on an NPCM730 BMC:

1. The peci node under /ahb/apb uses an absolute address (0xf0100000)
   instead of an APB-relative offset (0x100000), failing address
   translation and causing peci-npcm to fail probe with -EINVAL.
2. watchdog0..2 omit nuvoton,sysgcr = <&gcr>, causing npcm_wdt to warn
   that reset status is not supported since commit 7762911c0d8c.

Both patches were tested on NPCM730 hardware and verified with dtc on
nuvoton-npcm750-evb.dts and nuvoton-npcm730-gsj.dts.

William A. Kennington III (2):
  ARM: dts: nuvoton: npcm7xx: Fix PECI controller reg offset in APB
  ARM: dts: nuvoton: npcm7xx: Add nuvoton,sysgcr to watchdog nodes

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)


