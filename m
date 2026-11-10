Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94369606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G4fT7mK4;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=ZhxF+7lf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Unsubscribe-Post:
	List-Owner; bh=e3sukB2RZuy041Jain3ONjgs0JeDdnXnVzfL3HmKWPQ=; b=G4fT7mK4uy2yLG
	LmTpmOIA/bYvzjowTJ1DGi5T7lWm27hkpQYM4rhduGOrGD/zSXWuUbvxK2tRNSVIaIFw0JYrIwBB+
	hphXtih6gD9u+SuFtLSg0NnBoSGIyEFCT2g/apPQUn+CTFbJ08ov13IPnRELJKxm2dXVsAg6a8roU
	EGlPFcrLAS9YHiiZa7eqyqE342f/+yf8S4MKjGK7QfYD50vJo6N4Q1KKJta+29l4CegiWSLgHb8is
	ANaSc3UgyQzhZ4COprmb7WAE71YvWwZudf0VJc4P8efk2LsYDhs5HbMPiLQW5MrgUBoCVNb1fNumd
	k4ESEzK9rkgOLxqOrn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtSp-000000053bs-49UU;
	Tue, 10 Nov 2026 21:33:12 +0000
Received: from sonic-euwe1-0017.asd.mail.yahoo.com ([34.2.82.16] helo=sonic.asd.mail.yahoo.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtSm-000000053an-2HHE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1794346386; bh=e3sukB2RZuy041Jain3ONjgs0JeDdnXnVzfL3HmKWPQ=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=ZhxF+7lflqlnYWxsyQBtIObkuWTzfRj1tFMHhrKjku/OzJfcd+PUiWvbbQrgIGtWEI+ZGV9bpnxDgnbELdDl/HAWN0+iH+obGuPlyfOz9iD4z9XMOtePsVjQCytyHMn9pzRhKXy10l9Lw40SKIW5YaDMcRS4D1feajX72BjsXJNqHrg2QRT7p2TBPDr+pBidubSZmaBarB2DxdHERSvCwXpphb6epBGKf4a0+9rVs2Rp3vPQ7zzXpxs1NM79+ZpaRVjZfGZa6gsJpDr/eYlJWYzgdDsD5ZgjwxixW67PK9gXEIwTSuiBc48Yq5E+dR8LbSP/zqIYcz+MGUDdunA6uQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794346386; bh=l21te4vnjdcxm+BrNmCEfh7Dv5mjCuNFx4ER4X+DtJG=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=j5FXDQWfEVmumMHBlYMKvknxBesOIQvwDJTfk/aCx69Z/pZCL2Tz8nTiE/yed9RZFV8lOhcwq04zdzBlTPxBxLc88oWsnsERaijRlUEYWSa7VgZHDiMVx7oNcrpF2KMk5TEECZ6mX11nKpYy5WU/mlsIXI30AIFt9yMbX5wfYcDwOR3jv0jlqnn1liRsnaoKFXl+0AksPsj/vXvmzJoo+fn6B6ET3WabdGYEJw23URVzB4cHd5xeg1OAw3Yn0nxztjZlQQt3OUxKJyZGhpW7UE+6RApnjsBzgF0MgLxyC+7MeNzjNl+CvHUkIfX6gkVc0N8Sl7QEkiJT3OPOc9Y9hA==
X-YMail-OSG: ums8UF4VM1kpUin84ZgAz3DOu0IaeYMYRFDXRUcNecJIj62RFV7H0fkqiGEeFmV
 eTkrXqNr7.gegWTq5q9N.PwXu6z1uGCJ1_rsTfJOd1bQZRfIZQYw3tq6yw0eKNURekUp2zvCToEq
 6VS_g1zo_pUwKC9f9U3Ow_PJQ1KQKousf8V_AmLTiN7EfZBNB4xXaTbRmH6j47Yo_ArRUd3ZFK6R
 YPHyqvvxNUe3JJjHr9TeYqffQjH46RgtTAJdZBDs1rrFkFmJMjgZVIpOL7kJ0KKknhhv2gwu09xE
 _4hUEFNP7oh1UOOghP4r9SpYQx3JlZXD5QvjcvdZiOy9A7wQgjHQK1dVbmbO6IOVQcUKgkvcJbIi
 _58yjQetX_9izUC4OURj5XWvof5g0FBkDwDUztp0Ii.E9YjwYeoP.l82pJyDBKaDU.G5fvcFzk9H
 3EQII_KTmQ3hI6ztIJjaLgyg3wGvuk2Bk1cozenRlXOOqys.Y..UJjmJrR_TtkUSTpw46zoD9Nvn
 RMNsj_a.WCxMh_ANqwRcSf5.8R_XwjF606cIGhRlO8._wwI5caPWDfXSIpSL5zyk.6ZlQ5UbPITj
 WqvL4nNOOn_XopGLJQXKmmYtEQj2cwgyPhAzGBjaLNv4ZJHhUs11CjvWyUz20QuTUYL1UPWA.RgK
 hHtbM9.5pdfOlzjgQEXV9gIv4ayJsWDOVi5v5D6YgtTtQKvsAcyLlYk8bLOJAs7vrRLhSqvTIdOp
 fDr8yNr.8OFDxL93Um8v95nKiy5dJ9Kegyp4EhY9Bw4OT_0ZiTsh5XNCqqAVB4R3NpWsXREvrp4I
 5dwmYYBqY.qd4B5lIYxtDE.WJoEyYHunKwrNqCqqj8HFbFCd4aTj2oSTfWW64m3DPR31cI8BkFwG
 tS02dFo.rBB2fNpE_dI3v5AelJw4isfT9l_r5f.sVQFndUbp1a2Kw0goV7W_smkGtT3M7BMQQomR
 P7PEhL.z29G0i1v9EbrpPAqnFolECqe0KDN6IF0jAzIlz3dXtHhsULgzTNbdFT2rdPQ7d6IuosKZ
 6C93OXIvqfIIwT_B1AxKA1i_85D5rStgHvP4mPwFuDz.ngzofHseMc5MPmCF0O4Z1BXqijs1yuuq
 LCSdHB2wL_fa.vTVM4PQys5WGXF_75NUfPOwPN6G85YRimh9QurydgNxyFgFjGqZZzDCd66mlOof
 iAnNMKEWnp_qyJmDTE3Q0oOzMThonldb4tWAixGi0MZJGh1SSm_g1blqwToV4E.B1f6fCkKLovmd
 nzLdybp2fBQm2HqYe938oYfML5kuD_OCBkR9srx38mEUjg38dOjShU0MivQFKPMs4lsvdARbWwz3
 Za7HnYxGyhYHPac3tpQEQQEx4wg.SdmykDNI33VclqGYmjv7LUG4d0KytvtFpU_keymjPmptXq_O
 IYNFU8jW3ukntshwOWKDIxs45IaBn3FdGNveBDPI9upkfj8r4i1zcrMO2dmirJyfsFrAthahC8nc
 Lqt_D3kCtjp9s8496IeHMt5VkxA8zuvYcRje6S52UMEBHotNU8QM3mX4TkHiHS1ehw7Czwc5zvps
 A6S.w4McofXPUWCJJwzF4whp3lO5z7D5_Ga0Kv4W4Cl.MKD4lElYBsKJuHaCJ50gi3ihWsTP7VwC
 2.BlaR1m2NB1sx9h7yuCgjBRtDZFnlglTH2RYknjGwbprpdKDTMPPPT6P40In9r8pZYbkU8iz1L3
 ckx7mMtU9XqQrV.HywkEvlPjkhwYflTW.mDwQM38ZmJbhNJn0o7SrWs3HbbCPYMdpHMjVu5ox0fa
 hxCBhMl1Qb8ewn3C_5CFiyHfVQIdFF9.eUDcTa7JMW2b7xHcjqL1y7BtP4wb85RgwgkKQB5PKR2S
 CRjkLySmRtkoR2Bjhd20Cc98iOaOZWFS8VWl0g7fDEILcOcYuot9m0xZq5aiPfZU_eJKTTlL0Jf9
 d30gJE3HfremZQB8k2E_WPu5YnTHzVArbLhv.kBIsiL6M4Ev3q0eMksRCxi.288gW.CmB6i5fstN
 _J8.N.Mqa0_FJbqao7bi89he0ghj0C4MKwNo49Wz3QgE-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 4d11689c-fb14-48b6-a504-8ae88bbff09d
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-104 with HTTP; Tue, 10 Nov 2026 21:33:06 +0000
Received: from dip46.lsn.ir2.yahoo.com ([87.248.99.55])
          by hello (SMTP) with SMTP ID 652c0e1457d08e3a6c2674d732e5567c;
          Tue, 10 Nov 2026 21:33:04 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Nov 2026 22:33:02 +0100
Subject: [PATCH] spi: bcm2835: Add missing kernel-doc Return sections
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-spi-bcm2835-kdoc-return-v1-1-dffdfcc36233@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtoUjbEVxEPto0axW4kmwhj7
 27V43f4/xVcTMXh0K1g8lLXsTbQroN8O9eroJZm4MADEQX0STHlJ+9jj48yZjSZF6s49MIlRE4
 xErR6Mrno+3c+nv72Jd0lz98dbNsH+Ktr7XsAAAA=
X-Change-ID: 20261110-spi-bcm2835-kdoc-return-65e2d032b331
To: Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-spi@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794346383; l=2216;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=4NSC/saUCRz8KXKyYCJXbVeWomSvFe+rreCZagXgyQ8=;
 b=qMXOG/iy83N1K4B/M1Psk1OjG1XoVgzqIqmJlTXqi7/4QHM2uvC/37WX+tt9h9YEhXkZPcir7
 10iRLpsXXOkBvYPai6woeUCBJ51cC1LQnqpxiy/Z8lhBuB8T5St/AuZ
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20261110-spi-bcm2835-kdoc-return-v1-1-dffdfcc36233.ref@yahoo.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_133308_733092_890A2B25 
X-CRM114-Status: GOOD (  12.70  )
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

scripts/kernel-doc -Wall reports two functions in this file with no
description of their return value:

  bcm2835_spi_prepare_sg()
  bcm2835_spi_transfer_one_dma()

bcm2835_spi_prepare_sg() already describes its return value, but in a
"Return 0 on success ..." sentence that kernel-doc does not recognize.
Convert it to a "Return:" section.

bcm2835_spi_transfer_one_dma() has no description at all. It returns 1
once the DMA transfer has been started, which tells the SPI core that
the transfer is still in progress and will be finalized later by
spi_finalize_current_transfer() from the DMA completion callbacks, or a
negative error number. Document that.

No functional change.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/spi/spi-bcm2835.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index cc5748973281..8d4456bbe572 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -666,7 +666,8 @@ static void bcm2835_spi_dma_tx_done(void *data)
  * @is_tx: whether to submit DMA descriptor for TX or RX sglist
  *
  * Prepare and submit a DMA descriptor for the TX or RX sglist of @tfr.
- * Return 0 on success or a negative error number.
+ *
+ * Return: 0 on success or a negative error number.
  */
 static int bcm2835_spi_prepare_sg(struct spi_controller *ctlr,
 				  struct spi_transfer *tfr,
@@ -766,6 +767,10 @@ static int bcm2835_spi_prepare_sg(struct spi_controller *ctlr,
  * has finished, the DMA engine zero-fills the TX FIFO until it is half full.
  * (Tuneable with the DC register.)  So up to 9 gratuitous bus accesses are
  * performed at the end of an RX-only transfer.
+ *
+ * Return: 1 if the transfer was started and is still in progress, in which
+ * case it is finalized from the DMA completion callbacks, or a negative error
+ * number.
  */
 static int bcm2835_spi_transfer_one_dma(struct spi_controller *ctlr,
 					struct spi_transfer *tfr,

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-spi-bcm2835-kdoc-return-65e2d032b331

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>


